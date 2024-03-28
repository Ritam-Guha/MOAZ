#ifndef AUTOML_ZERO_RL_H_
#define AUTOML_ZERO_RL_H_

using namespace std;
#include <cstring>
#include <vector>
#include <deque>
#include <random>

//#if !defined(CCANADA) && !defined(HPCC)
#include <GL/gl.h>
#include <GL/glut.h>
//#endif

#define CLASSIC_RL_DIM 4
#define CLASSIC_RL_NUM_ACTION 3
#define MIN_EVAL 20

#define ID_CARTPOLE 1
#define ID_ACROBOT 2
#define ID_CART_CENTERING 3
#define ID_PENDULUM 4
#define ID_MOUNTAIN_CAR 5
#define ID_MOUNTAIN_CAR_CONTINUOUS 6

class classicRLEnv
{
public:

    int _id;
    vector < double > state; //state variables
    vector < double > state_po; //state variables (partially observable)
    vector < double > actionsDiscrete; //discrete actions map to an index into actionDiscrete
    int previousActionDiscrete;
    double previousActionContinuous;
    double reward;
    uniform_real_distribution<> disReset;
    uniform_real_distribution<> disNoise;
    int step;
    int max_step;
    size_t min_eval;
    bool solved;
    bool terminalState;
    vector < deque <double> > actionTrace;

    classicRLEnv(){
        disNoise = uniform_real_distribution<>(-M_PI, M_PI);
        state.reserve(CLASSIC_RL_DIM);
        state.resize(CLASSIC_RL_DIM);
        state_po.reserve(CLASSIC_RL_DIM);
        state_po.resize(CLASSIC_RL_DIM);
        terminalState = false;
        actionTrace.reserve(3); actionTrace.resize(3);
        for (size_t i = 0; i < 200; i++) {
            actionTrace[0].push_back(0);
            actionTrace[1].push_back(0);
            actionTrace[2].push_back(0);
        }
        min_eval = MIN_EVAL;
    }
    double bound(double x, double m, double M) { return min(max(x, m), M); }
    virtual void display_function(int, int, double) = 0;
    const vector < double > & getStateVec(bool po) { return po ? state_po : state; }
    double getStateVar(int var, bool po) { return po ? state_po[var] : state[var]; }
    inline int id() const { return _id; }
    virtual bool discreteActions() const { return true; }
    virtual double minActionContinuous() const { return 0.0; }
    virtual double maxActionContinuous() const { return 0.0; }
    virtual int numActions() const { return CLASSIC_RL_NUM_ACTION; }
    virtual void reset(mt19937 &) = 0;
    int maxStep() { return max_step; }
    void maxStep(int i) { max_step = i; }
    size_t minEval() { return min_eval; }
    virtual double update(int, double, mt19937 &) = 0;
    int getStep() { return step; }
    bool getSolved() { return solved; }
    virtual bool terminal() = 0;
    virtual ~classicRLEnv() { }

#if !defined(CCANADA) && !defined(HPCC)
    /***********************************************************************************************************************/
    void saveScreenshotToFile(std::string filename, int windowWidth, int windowHeight) {
        const int numberOfPixels = windowWidth * windowHeight * 3;
        unsigned char pixels[numberOfPixels];

        glPixelStorei(GL_PACK_ALIGNMENT, 1);
        glReadBuffer(GL_FRONT);
        glReadPixels(0, 0, windowWidth, windowHeight, GL_BGR_EXT, GL_UNSIGNED_BYTE, pixels);

        FILE *outputFile = fopen(filename.c_str(), "w");
        short header[] = {0, 2, 0, 0, 0, 0, (short) windowWidth, (short) windowHeight, 24};

        fwrite(&header, sizeof(header), 1, outputFile);
        fwrite(pixels, numberOfPixels, 1, outputFile);
        fclose(outputFile);
    }

    void drawBitmapText(char *string,float x,float y,float z){
        char *c;
        glRasterPos3f(x, y,z);

        for (c=string; *c != ':'; c++)
            glutBitmapCharacter(GLUT_BITMAP_TIMES_ROMAN_24, *c);
    }

    void drawStrokeText(char *string,float x,float y,float z)
    {
        char *c;
        glPushMatrix();
        glTranslatef(x, y,z);
        //glScalef(0.09f,-0.08f,z);
        glScalef(0.001f, 0.001f, z);

        for (c=string; *c != ':'; c++)
        {
            glutStrokeCharacter(GLUT_STROKE_ROMAN , *c);
        }
        glPopMatrix();
    }

    //actionProcessed should be in [-1.0,1.0]
    void drawTrace(int idx, string label, double actionProcessed, double yActionTrace){
        double traceXStep = 0.01;
        actionTrace[idx].push_front(0.1 * actionProcessed);
        actionTrace[idx].pop_back();
        glBlendFunc(GL_DST_ALPHA,GL_ONE_MINUS_DST_ALPHA);
        glPointSize(1);
        glColor3f(1.0 ,1.0, 1.0);
        glBegin(GL_LINES);
        double x = 0;
        for (size_t i = 0; i < actionTrace[idx].size(); i++){
            glVertex2d(x, yActionTrace + actionTrace[idx][i]);
            x = x - traceXStep;
        }
        glEnd();

        //action text
        char c[80];
        strcpy(c, label.c_str());
        //drawBitmapText(c, 0, yActionTrace, 0);
        drawStrokeText(c, 0.05, yActionTrace, 0);
    }

    ////actionProcessed should be in [-1.0,1.0]
    //void drawActionTrace(double actionProcessed, double yActionTrace){
    //   double traceXStep = 0.01;
    //   actionTrace.push_front(0.1 * actionProcessed);
    //   actionTrace.pop_back();
    //   glBlendFunc(GL_DST_ALPHA,GL_ONE_MINUS_DST_ALPHA);
    //   glPointSize(1);
    //   glColor3f(1.0 ,1.0, 1.0);
    //   glBegin(GL_LINES);
    //   double x = 0;
    //   for (size_t i = 0; i < actionTrace.size(); i++){
    //      glVertex2d(x, yActionTrace + actionTrace[i]);
    //      x = x - traceXStep;
    //   }
    //   glEnd();

    //   //action text
    //   char c[80];
    //   sprintf(c, "%s:", "Action");
    //   drawBitmapText(c, 0, yActionTrace, 0);
    //}

    void drawEpisodeStepCounter(int episode, int step, float x, float y){
        glColor3f(1.0 ,1.0, 1.0);
        char c[80];
        //sprintf(c, "Episode %d Step %d%s", episode, step, ":");
        (void)episode;
        sprintf(c, "Step %d%s", step, ":");
        drawStrokeText(c, x, y, 0);
    }

    vector<double> linspace(double a, double b, size_t N) {
        double h = (b - a) / static_cast<double>(N-1);
        vector<double> xs(N);
        typename vector<double>::iterator x;
        double val;
        for (x = xs.begin(), val = a; x != xs.end(); ++x, val += h)
            *x = val;
        return xs;
    }
#endif
};

/**********************************************************************************************/
class cartPole: public classicRLEnv
{
protected:
    const double GRAVITY = 9.8;
    const double MASSCART = 1.0;
    const double MASSPOLE = 0.1;
    const double TOTAL_MASS = (MASSPOLE + MASSCART);
    const double LENGTH = 0.5;                /* actually half the pole's length */
    const double POLEMASS_LENGTH = (MASSPOLE * LENGTH);
    const double FORCE_MAG = 10.0;
    const double TAU = 0.02;                  /* seconds between state updates */
    const double FOURTHIRDS = 1.3333333333333;
    const double SIX_DEGREES = 0.1047198;
    const double SEVEN_DEGREES = 0.1221730;
    const double TEN_DEGREES = 0.1745329;
    const double TWELVE_DEGREES = 0.2094384;
    const double FIFTEEN_DEGREES = 0.2617993;
    const double TWELVE_DEGREES_SQR = TWELVE_DEGREES * TWELVE_DEGREES;

    const double MIN_X = -4.8; //-1;
    const double MAX_X = 4.8; //1;

    //state array indexing
    const int _x = 0;
    const int _theta = 2;//1;
    const int _x_dot = 1;//2;
    const int _theta_dot = 3;

    int lastActionD = 0;

public:
    /**********************************************************************************************/
    cartPole(){
        disReset = uniform_real_distribution<>(-0.05, 0.05);
        actionsDiscrete.push_back(-FORCE_MAG);
        actionsDiscrete.push_back(0.0);
        actionsDiscrete.push_back(FORCE_MAG);
        _id = 1;
        max_step = 500;
    }

    /**********************************************************************************************/
    ~cartPole() {
        state.clear();
        state_po.clear();
        actionsDiscrete.clear();
        actionTrace.clear();
    }

    /**********************************************************************************************/
    void normalizeState(bool po){
        if (po){
            state_po[_x] /= MAX_X;
            state_po[_theta] /= TWELVE_DEGREES;
        }
    }

    /**********************************************************************************************/
    void reset(mt19937 &rng){
        state_po[_x] = state[_x] = disReset(rng);
        state_po[_theta] = state[_theta] = disReset(rng);
        state[_x_dot] = disReset(rng);
        state[_theta_dot] = disReset(rng);
        reward = 0;
        step = 0;
        solved = false;
        terminalState = false;
        //normalizeState(false);
    }

    /**********************************************************************************************/
    bool terminal(){
        if (step >= max_step || abs(state[_theta]) > TWELVE_DEGREES || abs(state[_x]) > 2.4)
            terminalState = true;
        if (step >= 200)
            solved = true;
        return terminalState;
    }

    /**********************************************************************************************/
    double update(int actionD, double actionC, mt19937 &rng){

        double xacc, thetaacc, force, costheta, sintheta, temp;

        (void)rng;

        //action 1 is ignored
        if (actionD == 0){
            lastActionD = 0;
            force = actionsDiscrete[lastActionD];
        }
        else if (actionD == 2){
            lastActionD = 2;
            force = actionsDiscrete[lastActionD];
        }
        else
            force = actionsDiscrete[lastActionD];

        ////action 1 is ignored
        //if (actionC <= 0){
        //   lastActionD = 0;
        //   force = actionsDiscrete[lastActionD];
        //}
        //else if (actionC > 0){
        //   lastActionD = 2;
        //   force = actionsDiscrete[lastActionD];
        //}
        //else
        //   force = actionsDiscrete[lastActionD];


        costheta = cos(state[_theta]);
        sintheta = sin(state[_theta]);

        temp = (force + POLEMASS_LENGTH * state[_theta_dot] * state[_theta_dot] * sintheta)
               / TOTAL_MASS;

        thetaacc = (GRAVITY * sintheta - costheta * temp)
                   / (LENGTH * (FOURTHIRDS - MASSPOLE * costheta * costheta
                                             / TOTAL_MASS));

        xacc  = temp - POLEMASS_LENGTH * thetaacc * costheta / TOTAL_MASS;

        /*** Update the four state variables, using Euler's method. ***/

        state[_x]  += TAU * state[_x_dot];
        state_po[_x] = state[_x];

        state[_x_dot] += TAU * xacc;

        state[_theta] += TAU * state[_theta_dot];
        state_po[_theta] = state[_theta];

        state[_theta_dot] += TAU * thetaacc;

        step++;

        reward = 1.0;

        //normalizeState(false);
        return reward;
    }

    /**********************************************************************************************/
    //opengl
    void display_function(int episode, int actionD, double actionC)
    {
        //           (void)actionC;
        //  #if !defined(CCANADA) && !defined(HPCC)
        //           double r1 = 1.0;
        //           double x2, y2;
        //
        //           glClear(GL_COLOR_BUFFER_BIT);
        //
        //          glLineWidth(5.0);
        //
        //          //cart
        //          glColor3f(0.0 ,0.0,1.0);
        //          glBegin(GL_TRIANGLES);
        //          glVertex2f(state[_x] - 0.15, 0.075);
        //          glVertex2f(state[_x] - 0.15, -0.075);
        //          glVertex2f(state[_x] + 0.15, 0.075);
        //          glVertex2f(state[_x] + 0.15, 0.075);
        //          glVertex2f(state[_x] - 0.15, -0.075);
        //          glVertex2f(state[_x] + 0.15, -0.075);
        //          glEnd();
        //
        //          //pole
        //          x2 = state[_x] + r1 * cos (M_PI/2 - state[_theta]);
        //          y2 = r1 * sin(M_PI/2 - state[_theta]);
        //          glColor3f(1.0 ,1.0, 1.0);
        //          glBegin (GL_LINES);
        //          glVertex2d(state[_x], 0.0);
        //          glVertex2d(x2, y2);
        //
        //          //x bounds surface
        //          glVertex2d(MIN_X, 0.0);
        //          glVertex2d(MAX_X, 0.0);
        //
        //          glEnd();
        //
        //          //discrete action arrows
        //          if (step > 0){
        //             //action 1 is ignored
        //             double force = 0;
        //             if (actionD == 0)
        //                force = actionsDiscrete[0];
        //             else if (actionD == 2)
        //                force = actionsDiscrete[2];
        //
        //             int dir = 1;
        //             if (actionD == 0)
        //                dir = -1;
        //             else if (actionD == 2)
        //                dir = 1;
        //             glBegin(GL_POLYGON);
        //             glVertex3f(dir * 0.12, -0.2, 0);
        //             glVertex3f(dir * 0.25, -0.25, 0);
        //             glVertex3f(dir * 0.12, -0.3, 0);
        //             glEnd();
        //             glLineWidth(2.0);
        //             drawTrace(0, "Action:", force/FORCE_MAG, -1.0);
        //          }
        //
        //          glLineWidth(1.0);
        //          drawEpisodeStepCounter(episode, step, -1.9, -1.9);
        //
        //          glColor3f(1.0 ,1.0, 1.0);
        //          char c[80];
        //          if (step == 0)
        //             sprintf(c, "CartPole Initial Conditions%s", ":");
        //          else if (terminal())
        //             sprintf(c, "CartPole Terminal%s", ":");
        //          else
        //             sprintf(c, "CartPole%s", ":");
        //
        //          drawStrokeText(c, -1.9, -1.7, 0);
        //
        //          glFlush();
        // #endif
    }
};

/**********************************************************************************************/
class acrobot: public classicRLEnv
{
protected:
    const double maxTheta1 = M_PI;
    const double maxTheta2 = M_PI;
    const double maxTheta1Dot = 4 * M_PI;
    const double maxTheta2Dot = 9 * M_PI;
    const double m1 = 1.0;
    const double m2 = 1.0;
    const double l1 = 1.0;
    const double l2 = 1.0;
    const double lc1 = 0.5;
    const double lc2 = 0.5;
    const double I1 = 1.0;
    const double I2 = 1.0;
    const double g = 9.8;
    const double dt = 0.05;
    const double acrobotGoalPosition = 1.0;

    //state array indexing
    const int _theta1 = 0;
    const int _theta2 = 1;
    const int _theta1Dot = 2;
    const int _theta2Dot = 3;

    const int _theta1_po = 0;
    const int _theta2_po = 1;

public:
    /**********************************************************************************************/
    acrobot(){
        disReset = uniform_real_distribution<>(-0.1, 0.1);
        actionsDiscrete.push_back(-1.0);
        actionsDiscrete.push_back(0.0);
        actionsDiscrete.push_back(1.0);
        _id = 2;
        max_step = 200;
        //min_eval = 3;
    }

    /**********************************************************************************************/
    ~acrobot() { }

    /**********************************************************************************************/
    bool discreteActions() const { return false; }


    /**********************************************************************************************/
    double minActionContinuous() const { return -1.0; }

    /**********************************************************************************************/
    double maxActionContinuous() const { return 1.0; }

    /**********************************************************************************************/
    void normalizeState(bool po){
        if (po){
            state_po[_theta1] /=  maxTheta1;
            state_po[_theta2] /=  maxTheta2;
        }
    }

    /**********************************************************************************************/
    void reset(mt19937 &rng){
        state_po[_theta1] = state[_theta1] = disReset(rng);

        state_po[_theta2] = state[_theta2] = disReset(rng);

        state[_theta1Dot] = disReset(rng);

        state[_theta2Dot] = disReset(rng);

        reward = 0;

        step = 0;
        solved = false;
        terminalState = false;

        //normalizeState(false);
    }

    /**********************************************************************************************/
    double update(int actionD, double actionC, mt19937 &rng) {

        (void)actionD;
        (void)rng;

        //double torque = actionsDiscrete[actionD];
        double torque = bound(actionC, -1.0, 1.0);
        double d1;
        double d2;
        double phi_2;
        double phi_1;

        double theta2_ddot;
        double theta1_ddot;

        int count = 0;
        while (!terminal() && count < 4) {
            count++;

            d1 = m1 * pow(lc1, 2) + m2 * (pow(l1, 2) + pow(lc2, 2) + 2 * l1 * lc2 * cos(state[_theta2])) + I1 + I2;
            d2 = m2 * (pow(lc2, 2) + l1 * lc2 * cos(state[_theta2])) + I2;

            phi_2 = m2 * lc2 * g * cos(state[_theta1] + state[_theta2] - M_PI / 2.0);
            phi_1 = -(m2 * l1 * lc2 * pow(state[_theta2Dot], 2) * sin(state[_theta2]) - 2 * m2 * l1 * lc2 * state[_theta1Dot] * state[_theta2Dot] * sin(state[_theta2])) +
                    (m1 * lc1 + m2 * l1) * g * cos(state[_theta1] - M_PI / 2.0) + phi_2;

            theta2_ddot = (torque + (d2 / d1) * phi_1 - m2 * l1 * lc2 * pow(state[_theta1Dot], 2) * sin(state[_theta2]) - phi_2) / (m2 * pow(lc2, 2) + I2 - pow(d2, 2) / d1);

            theta1_ddot = -(d2 * theta2_ddot + phi_1) / d1;

            state[_theta1Dot] += theta1_ddot * dt;
            state[_theta2Dot] += theta2_ddot * dt;

            state[_theta1] += state[_theta1Dot] * dt;
            state[_theta2] += state[_theta2Dot] * dt;
            state[_theta1] = wrap(state[_theta1], -maxTheta1, maxTheta1);
            state[_theta2] = wrap(state[_theta2], -maxTheta2, maxTheta2);
            state[_theta1Dot] = bound(state[_theta1Dot], -maxTheta1Dot, maxTheta1Dot);
            state[_theta2Dot] = bound(state[_theta2Dot], -maxTheta2Dot, maxTheta2Dot);
        }

        state_po[_theta1] = state[_theta1];
        state_po[_theta2] = state[_theta2];

        step++;

        reward = -1.0;

        //normalizeState(false);
        return reward;
    }

    /**********************************************************************************************/
    bool terminal(){
        if (step >= max_step || (-cos(state[0]) - cos(state[1] + state[0]) > 1.0))
            terminalState = true;
        return terminalState;
    }

    /**********************************************************************************************/
    double wrap(double x, double m, double M){
        double diff = M - m;
        while (x > M)
            x = x - diff;
        while (x < m)
            x = x + diff;
        return x;
    }

    /**********************************************************************************************/
    //opengl
    void display_function(int episode, int actionD, double actionC)
    {
        //         (void)episode;
        //         (void)actionD;
        //#if !defined(CCANADA) && !defined(HPCC)
        //         double r1 = 1.0;
        //         double r2 = 1.0;
        //         double x2, y2, x3, y3;
        //         glClear(GL_COLOR_BUFFER_BIT);
        //
        //         glLineWidth(5.0);
        //
        //         x2 = r1 * cos(M_PI/2 - state[_theta1]);
        //         y2 = r1 * sin(M_PI/2 - state[_theta1]);
        //         glColor3f(1.0 ,1.0,1.0);
        //         glBegin (GL_LINES);
        //         glVertex2d(0.0,0.0);
        //         glVertex2d(-x2, -y2);
        //
        //         x3 = x2 + r2 * cos(M_PI/2 - (state[_theta1] + state[_theta2]));
        //         y3 = y2 + r2 * sin(M_PI/2 - (state[_theta1] + state[_theta2]));
        //         glColor3f(1.0 ,1.0,1.0);
        //         glBegin (GL_LINES);
        //         glVertex2d(-x2, -y2);
        //         glVertex2d(-x3, -y3);
        //
        //         //surface
        //         glVertex2d(-1.5,0.0);
        //         glVertex2d(1.5,0.0);
        //
        //         //goal
        //         glColor3f(0.0 ,1.0, 0.0);
        //         glVertex2d(-1.5, r1);
        //         glVertex2d(1.5, r1);
        //
        //         glEnd();
        //
        //         if (step > 0){
        //            glColor3f(1.0 ,1.0,1.0);
        //            double torque = bound(actionC, -1.0, 1.0);
        //            glLineWidth(2.0);
        //            drawTrace(0, "Action:", torque/1.0, 1.2);
        //         }
        //
        //         glColor3f(1.0 ,1.0, 1.0);
        //         glLineWidth(1.0);
        //         drawEpisodeStepCounter(episode, step, -1.9, -1.9);
        //
        //         char c[80];
        //         if (step == 0)
        //            sprintf(c, "Acrobot Initial Conditions%s", ":");
        //         else if (terminal())
        //            sprintf(c, "Acrobot Terminal%s", ":");
        //         else
        //            sprintf(c, "Acrobot%s", ":");
        //         drawStrokeText(c, -1.9, -1.7, 0);
        //
        //         glFlush();
        //#endif
    }
};

/**********************************************************************************************/
class cartCentering: public classicRLEnv
{
protected:
    /*** Parameters for simulation ***/
    const double MASSCART = 2.0;
    const double FORCE_MAG = 1.0;
    const double TAU = 0.05; // seconds between state updates

    //these may depend on each other and dt
    const double MAX_X = 1.5;
    const double MAX_V = 6;

    const double MIN_VAR_INI = -0.75;
    const double MAX_VAR_INI = 0.75;
    const double NEAR_ORIGIN = 0.01;

    //state array indexing
    const int X = 0;
    const int V = 1;

    int lastActionD = -FORCE_MAG;
    uniform_real_distribution<> disReset;

public:
    /**********************************************************************************************/
    cartCentering(){
        disReset = uniform_real_distribution<>(MIN_VAR_INI, MAX_VAR_INI);
        actionsDiscrete.push_back(-FORCE_MAG);
        actionsDiscrete.push_back(0.0);
        actionsDiscrete.push_back(FORCE_MAG);
        _id = 3;
        max_step = 500;
    }

    /**********************************************************************************************/
    ~cartCentering() { }

    /**********************************************************************************************/
    void normalizeState(bool po){
        if (po){
            state_po[X] /=  MAX_X;
            state_po[V] /= M_PI;
        }
    }

    /**********************************************************************************************/
    void reset(mt19937 &rng){

        step = 0;

        do{
            state_po[X] = state[X] = disReset(rng);
            state[V] = disReset(rng);
            terminalState = false;
        } while(terminal());

        state_po[V] = disNoise(rng);

        state[2] = disNoise(rng);
        state[3] = disNoise(rng);

        reward = 0;
        solved = false;
        //normalizeState(false);
    }

    /**********************************************************************************************/
    bool terminal(){
        terminalState = step >= max_step || (abs(state[X]) <= NEAR_ORIGIN && abs(state[V]) <= NEAR_ORIGIN) || abs(state[X]) > MAX_X ? true : false;
        if (abs(state[X]) <= NEAR_ORIGIN && abs(state[V]) <= NEAR_ORIGIN)
            solved = true;

        return terminalState;
    }

    /**********************************************************************************************/
    double update(int actionD, double actionC, mt19937 &rng){

        (void) actionC;
        double force;

        //action 1 is ignored
        if (actionD == 0){
            lastActionD = 0;
            force = actionsDiscrete[lastActionD];
        }
        else if (actionD == 2){
            lastActionD = 2;
            force = actionsDiscrete[lastActionD];
        }
        else
            force = actionsDiscrete[lastActionD];

        double acc_t = force/MASSCART;

        state[X] += TAU * state[V];
        state_po[X] = state[X];

        state[V] += TAU * acc_t;
        state[V] = bound(state[V], -MAX_V, MAX_V);
        state_po[V] = disNoise(rng);

        state[2] = disNoise(rng);
        state[3] = disNoise(rng);

        step++;

        if (terminal())
            reward = -((min(abs(state[X]),MAX_X)/MAX_X) + (min(abs(state[V]),MAX_V)/MAX_V) + (min(abs((double)step), (double)max_step)/max_step))/3;
            //reward = -((((abs(state[X])/MAX_X) + (abs(state[V])/MAX_V)/2)) + (((double)step/max_step)*0.1));
        else
            reward = 0;

        //normalizeState(false);
        return reward;
    }

    /**********************************************************************************************/
    //opengl
    void display_function(int episode, int actionD, double actionC)
    {
        //         (void)episode;
        //         (void)actionD;
        //         (void)actionC;
        //#if !defined(CCANADA) && !defined(HPCC)
        //         glClear(GL_COLOR_BUFFER_BIT);
        //
        //         glLineWidth(5.0);
        //
        //         //cart
        //         glColor3f(0.0 ,0.0,1.0);
        //         glBegin(GL_TRIANGLES);
        //         glVertex2f(state[X] - 0.15, 0.075);
        //         glVertex2f(state[X] - 0.15, -0.075);
        //         glVertex2f(state[X] + 0.15, 0.075);
        //         glVertex2f(state[X] + 0.15, 0.075);
        //         glVertex2f(state[X] - 0.15, -0.075);
        //         glVertex2f(state[X] + 0.15, -0.075);
        //         glEnd();
        //         glColor3f(1.0 ,1.0,1.0);
        //         glBegin (GL_LINES);
        //         glVertex2d(state[X], -0.075);
        //         glVertex2d(state[X], 0.075);
        //
        //         //x bounds surface
        //         glVertex2d(-MAX_X,0.0);
        //         glVertex2d(MAX_X,0.0);
        //
        //         //ticks (green centre) TMP
        //         for (int i = 1; MAX_X - (i*0.1) > -MAX_X; i++){
        //            glVertex2d(MAX_X - (i*0.1), 0.0);
        //            if (isEqual(MAX_X - (i*0.1), 0)){
        //               glColor3f(0.0 ,1.0,0.0);
        //               glVertex2d(1.5 - (i*0.1), isEqual(1.5 - (i*0.1), 0) ? -0.1 : -0.025);
        //               glColor3f(1.0 ,1.0,1.0);
        //            }
        //         }
        //         glEnd();
        //
        //         if (step > 0){
        //            //discrete action arrows, action 1 is ignored
        //            double force = 0;
        //            if (actionD == 0)
        //               force = actionsDiscrete[0];
        //            else if (actionD == 2)
        //               force = actionsDiscrete[2];
        //            else
        //               force = actionsDiscrete[lastActionD];
        //
        //            int dir = 1;
        //            if (force < 0)
        //               dir = -1;
        //            else if (force > 0)
        //               dir = 1;
        //            glBegin(GL_POLYGON);
        //            glVertex3f(dir * 0.12, -0.2, 0);
        //            glVertex3f(dir * 0.25, -0.25, 0);
        //            glVertex3f(dir * 0.12, -0.3, 0);
        //            glEnd();
        //
        //            if (abs(state[X]) <= NEAR_ORIGIN && abs(state[V]) <= NEAR_ORIGIN){
        //               glColor3f(0.0 ,1.0,0.0);
        //               glBegin(GL_LINE_LOOP);
        //               for(int i =0; i <= 300; i++){
        //                  double angle = 2 * M_PI * i / 300;
        //                  double x = cos(angle);
        //                  double y = sin(angle);
        //                  glVertex2d(x,y);
        //               }
        //            }
        //            glEnd();
        //            glLineWidth(2.0);
        //            drawTrace(0, "Action:", force/FORCE_MAG, -1.0);
        //         }
        //
        //         glColor3f(1.0 ,1.0, 1.0);
        //         glLineWidth(1.0);
        //         drawEpisodeStepCounter(episode, step, -1.9, -1.9);
        //
        //         char c[80];
        //         if (step == 0)
        //            sprintf(c, "CartCentering Initial Conditions%s", ":");
        //         else if (terminal())
        //            sprintf(c, "CartCentering Terminal%s", ":");
        //         else
        //            sprintf(c, "CartCentering%s", ":");
        //         drawStrokeText(c, -1.9, -1.7, 0);
        //
        //         glFlush();
        //#endif
    }
};

/**********************************************************************************************/
class pendulum: public classicRLEnv
{
protected:
    const double maxSpeed = 8;
    const double maxTorque = 2;
    double max_costs;
    const double m = 1.0;
    const double l = 1.0;
    const double g = 10;
    const double dt = 0.05;
    uniform_real_distribution<> disResetDot;

    //internal state differs from state for observation
    vector <double> _state;
    //state array indexing
    const int _theta = 0;
    const int _thetaDot = 1;

    double costs_sum;

public:
    /**********************************************************************************************/
    double angle_normalize(double x){
        double a = fmod(x + M_PI, 2 * M_PI);
        return a >= 0 ? (a - M_PI) : (a + M_PI);
    }

    /**********************************************************************************************/
    bool discreteActions() const { return false; }

    /**********************************************************************************************/
    double theta() { return _state[_theta]; }

    /**********************************************************************************************/
    double thetaDot() { return _state[_thetaDot]; }

    /**********************************************************************************************/
    double maxActionContinuous() const { return maxTorque; }

    /**********************************************************************************************/
    double minActionContinuous() const { return -maxTorque; }

    /**********************************************************************************************/
    pendulum(){
        disReset = uniform_real_distribution<>(-M_PI, M_PI);
        disResetDot = uniform_real_distribution<>(-1.0, 1.0);
        actionsDiscrete.push_back(-maxTorque);
        actionsDiscrete.push_back(0.0);
        actionsDiscrete.push_back(maxTorque);
        _id = 4;
        max_step = 300;
        //min_eval = 3;
        _state.reserve(2);
        _state.resize(2);

        max_costs = pow(M_PI, 2) + 0.1 * pow(maxSpeed, 2) + 0.001 * pow(maxTorque, 2);
        //max_costs_all = -(max_costs * max_step);
    }

    /**********************************************************************************************/
    ~pendulum() { }

    /**********************************************************************************************/
    void reset(mt19937 &rng){

        _state[_theta] = disReset(rng);
        _state[_thetaDot] = disResetDot(rng);

        state[0] = state_po[0] = cos(_state[_theta]);
        state[1] = state_po[1] = sin(_state[_theta]);

        state[2] = _state[_thetaDot];

        state[3] = disNoise(rng);

        reward = 0;

        solved = false;
        step = 0;
        terminalState = false;
    }

    /**********************************************************************************************/
    bool terminal(){
        terminalState = step >= max_step ? true : false;
        return terminalState;
    }

    /**********************************************************************************************/
    double update(int actionD, double actionC, mt19937 &rng) {
        (void)actionD;
        double torque = bound(actionC, -maxTorque, maxTorque);

        double costs = pow(angle_normalize(_state[_theta]),2) + 0.1 * pow(_state[_thetaDot],2) + 0.001 * pow(torque, 2);
        double newThetaDot = _state[_thetaDot] + (-3 * g / (2 * l) * sin(_state[_theta] + M_PI) + 3.0 / (m * pow(l, 2)) * torque) * dt;
        _state[_theta] = _state[_theta] + newThetaDot * dt;
        _state[_thetaDot] = newThetaDot;
        _state[_thetaDot] = bound(_state[_thetaDot], -maxSpeed, maxSpeed);

        state[0] = state_po[0] = cos(_state[_theta]);
        state[1] = state_po[1] = sin(_state[_theta]);

        state[2] = _state[_thetaDot];

        state[3] = disNoise(rng);

        step++;

        reward = -costs;

        return reward;
    }

    /**********************************************************************************************/
    //opengl
    void display_function(int episode, int actionD, double actionC)
    {
        //         (void)actionD;
        // #if !defined(CCANADA) && !defined(HPCC)
        //         double r1 = 1.0;
        //         double x2, y2;
        //         glClear(GL_COLOR_BUFFER_BIT);
        //
        //         glLineWidth(5.0);
        //
        //         x2 = r1 * cos(M_PI/2 - _state[_theta]);
        //         y2 = r1 * sin(M_PI/2 - _state[_theta]);
        //         glColor3f(1.0 ,1.0,1.0);
        //         glBegin (GL_LINES);
        //         glVertex2d(0.0,0.0);
        //         glVertex2d(-x2, y2);
        //
        //         //surface
        //         glVertex2d(-1.5,0.0);
        //         glVertex2d(1.5,0.0);
        //         glEnd();
        //
        //         if (step > 0){
        //            //action
        //            double torque = bound(actionC, -maxTorque, maxTorque);
        //            const int sides = 40;
        //            const double radius = 0.2;
        //
        //            int dir = 1;
        //            int start = 0;
        //            int end = 0;
        //
        //            if (actionC < 0){
        //               dir = -1;
        //               start = -180;
        //               end = -90;
        //            }
        //            else if (actionC > 0){
        //               dir = 1;
        //               start = -90;
        //               end = 20;
        //            }
        //            glBegin(GL_LINES);
        //            for (int a = start; a < end; a += 360 / sides){
        //               double heading = a * M_PI / 180;
        //               glVertex2d(cos(heading) * radius, sin(heading) * radius);
        //            }
        //            glEnd();
        //
        //            //arrow
        //            glBegin(GL_POLYGON);
        //            glVertex3f(dir * 0.25, 0.0, 0);
        //            glVertex3f(dir * 0.2, 0.1 + ((abs(torque)/maxTorque)/10), 0);
        //            glVertex3f(dir * 0.15, 0.0, 0);
        //            glEnd();
        //
        //            //action trace
        //            glLineWidth(2.0);
        //            drawTrace(0, "Action:", torque/maxTorque, -1.2);
        //         }
        //         glColor3f(1.0 ,1.0, 1.0);
        //         glLineWidth(1.0);
        //         drawEpisodeStepCounter(episode, step, -1.9, -1.9);
        //
        //         char c[80];
        //         if (step == 0)
        //            sprintf(c, "Pendulum Initial Conditions%s", ":");
        //         else if (terminal())
        //            sprintf(c, "Pendulum Terminal%s", ":");
        //         else
        //            sprintf(c, "Pendulum%s", ":");
        //         drawStrokeText(c, -1.9, -1.7, 0);
        //
        //         glFlush();
        // #endif
    }
};

/**********************************************************************************************/
class mountainCar: public classicRLEnv
{
protected:
    const double min_position = -1.2;
    const double max_position = 0.6;
    const double max_speed = 0.07;
    const double goal_position = 0.5;
    const double goal_velocity = 0.0;
    const double force = 0.001;
    const double gravity = 0.0025;

    //state array indexing
    const int _position = 0;
    const int _velocity = 1;

public:

    /**********************************************************************************************/
    mountainCar(){
        disReset = uniform_real_distribution<>(-0.6, -0.4);
        _id = 5;
        max_step = 200;
    }

    /**********************************************************************************************/
    ~mountainCar() { }

    /**********************************************************************************************/
    void normalizeState(bool po){
        if (po)
            state_po[_position]  = (state_po[_position] - min_position) / (max_position - min_position);
    }

    /**********************************************************************************************/
    void reset(mt19937 &rng){
        state[_position] = state_po[_position] = disReset(rng);
        state[_velocity] = 0;

        state_po[_velocity] = disNoise(rng);

        state[2] = disNoise(rng);
        state[3] = disNoise(rng);
        state_po[2] = disNoise(rng);
        state_po[3] = disNoise(rng);

        reward = 0;

        solved = false;
        step = 0;
        terminalState = false;
        //normalizeState(false);
    }

    /**********************************************************************************************/
    bool terminal(){
        if (step >= max_step || (state[_position] >= goal_position)) // && state[_velocity] >= goal_velocity))
            terminalState = true;
        if (step <= 120 && (state[_position] >= goal_position))
            solved = true;
        return terminalState;
    }

    /**********************************************************************************************/
    double update(int actionD, double actionC, mt19937 &rng) {
        (void)actionC;

        state[_velocity] += (actionD - 1) * force + cos(3 * state[_position]) * -gravity;
        state[_velocity] = bound(state[_velocity], -max_speed, max_speed);
        state[_position] += state[_velocity];
        state[_position] = bound(state[_position], min_position, max_position);
        if (state[_position] == min_position && state[_velocity] < 0)
            state[_velocity] = 0;

        state_po[_position] = state[_position];
        state_po[_velocity] = disNoise(rng);

        state[2] = disNoise(rng);
        state[3] = disNoise(rng);
        state_po[2] = disNoise(rng);
        state_po[3] = disNoise(rng);

        step++;

        reward = -1.0;

        //normalizeState(false);
        return reward;
    }

    /**********************************************************************************************/
    //opengl
    void display_function(int episode, int actionD, double actionC)
    {
        //         (void)episode;
        //         (void)actionC;
        //#if !defined(CCANADA) && !defined(HPCC)
        //         glClear(GL_COLOR_BUFFER_BIT);
        //
        //         glLineWidth(5.0);
        //
        //         //track
        //         glBlendFunc(GL_DST_ALPHA,GL_ONE_MINUS_DST_ALPHA);
        //         glPointSize(1);
        //         glColor3f(1.0 ,1.0, 1.0);
        //         glBegin(GL_LINES);
        //         double carX = 0;
        //         double carXS = 0;
        //         double goalX = 0;
        //         double goalXS = 0;
        //         double x = -2.0;
        //         vector<double> xs = linspace(min_position, max_position, 100);
        //         for (size_t i = 1; i < xs.size()-1; i++){
        //            glVertex2d(x, sin(3 * xs[i]) * .45 + .55);
        //            if (state[_position] >= xs[i-1] && state[_position] <= xs[i+1]){
        //               carX = x;
        //               carXS = xs[i];
        //            }
        //            if (goal_position >= xs[i-1] && goal_position <= xs[i+1]){
        //               goalX = x;
        //               goalXS = xs[i];
        //            }
        //            x = x + 0.04;
        //         }
        //         glEnd();
        //
        //         //car
        //         glBegin(GL_LINES);
        //         glColor3f(1.0 ,0.0, 0.0);
        //         glVertex2d(carX,  (sin(3 * carXS) * .45 + .55) + 0.1);
        //         glVertex2d(carX, (sin(3 * carXS) * .45 + .55) - 0.1);
        //         glEnd();
        //
        //         //goal
        //         glBegin(GL_LINES);
        //         glColor3f(0.0 ,1.0, 0.0);
        //         glVertex2d(goalX,  (sin(3 * goalXS) * .45 + .55) + 0.1);
        //         glVertex2d(goalX, (sin(3 * goalXS) * .45 + .55) - 0.1);
        //         glEnd();
        //
        //         if (step > 0){
        //            //action arrows
        //            int dir = 1;
        //            if (actionD == 0)
        //               dir = -1;
        //            else if (actionD == 2)
        //               dir = 1;
        //            glColor3f(1.0 ,1.0, 1.0);
        //            glBegin(GL_POLYGON);
        //            glVertex3f(dir * 0.12, -0.2, 0);
        //            glVertex3f(dir * 0.25, -0.25, 0);
        //            glVertex3f(dir * 0.12, -0.3, 0);
        //            glEnd();
        //            glLineWidth(2.0);
        //            drawTrace(0, "Action:", actionD - 1, -1.0);
        //         }
        //         drawEpisodeStepCounter(episode, step, -1.9, 1.3);
        //         glFlush();
        //#endif
    }
};

/**********************************************************************************************/
class mountainCarContinuous: public classicRLEnv
{
protected:
    const double min_action = -1.0;
    const double max_action = 1.0;
    const double min_position = -1.2;
    const double max_position = 0.6;
    const double max_speed = 0.07;
    const double goal_position = 0.45;
    const double goal_velocity = 0.0;
    const double power = 0.0015;
    const double gravity = 0.0025;

    //state array indexing
    const int _position = 0;
    const int _velocity = 1;

    double min_reward;

public:

    /**********************************************************************************************/
    bool discreteActions() const { return false; }

    /**********************************************************************************************/
    double maxActionContinuous() const { return max_action; }

    /**********************************************************************************************/
    double minActionContinuous() const { return min_action; }

    /**********************************************************************************************/
    mountainCarContinuous(){
        disReset = uniform_real_distribution<>(-0.6, -0.4);
        _id = 6;
        max_step = 200;
    }

    /**********************************************************************************************/
    ~mountainCarContinuous() { }

    /**********************************************************************************************/
    void normalizeState(bool po){
        if (po)
            state_po[_position]  = (state_po[_position] - min_position) / (max_position - min_position);
    }

    /**********************************************************************************************/
    void reset(mt19937 &rng){

        state[_position] = 0;//state_po[_position] = disReset(rng);
        state[_velocity] = 0;

        state_po[_velocity] = disNoise(rng);

        state[2] = 0;//disNoise(rng);
        state[3] = 0;//disNoise(rng);

        reward = 0;

        solved = false;
        step = 0;
        terminalState = false;
        //normalizeState(false);
    }

    /**********************************************************************************************/
    bool terminal(){
        if (step >= max_step || (state[_position] >= goal_position && state[_velocity] >= goal_velocity))
            terminalState = true;
        return terminalState;
    }

    /**********************************************************************************************/
    double update(int actionD, double actionC, mt19937 &rng) {

        (void)actionD;
        double force = bound(actionC, min_action, max_action);
        state[_velocity] += force * power - gravity * cos(3 * state[_position]);
        state[_velocity] = bound(state[_velocity], -max_speed, max_speed);
        state[_position] += state[_velocity];
        state[_position] = bound(state[_position], min_position, max_position);
        if (state[_position] == min_position && state[_velocity] < 0)
            state[_velocity] = 0;

        state_po[_position] = state[_position];
        state_po[_velocity] = disNoise(rng);

        state[2] = disNoise(rng);
        state[3] = disNoise(rng);

        step++;

        //reward 2
        if (terminal() && step < max_step)
            reward = 100;
        else
            reward = -(pow(force, 2) * 0.1);

        //normalizeState(false);
        return reward;
    }

    /**********************************************************************************************/
    //opengl
    void display_function(int episode, int actionD, double actionC)
    {
        //         (void)episode;
        //         (void)actionD;
        //#if !defined(CCANADA) && !defined(HPCC)
        //         glClear(GL_COLOR_BUFFER_BIT);
        //
        //         glLineWidth(5.0);
        //
        //         //track
        //         glBlendFunc(GL_DST_ALPHA,GL_ONE_MINUS_DST_ALPHA);
        //         glPointSize(1);
        //         glColor3f(1.0 ,1.0, 1.0);
        //         glBegin(GL_LINES);
        //         double carX = 0;
        //         double carXS = 0;
        //         double goalX = 0;
        //         double goalXS = 0;
        //         double x = -2.0;
        //         vector<double> xs = linspace(min_position, max_position, 100);
        //         for (size_t i = 1; i < xs.size()-1; i++){
        //            glVertex2d(x, sin(3 * xs[i]) * .45 + .55);
        //            if (state[_position] >= xs[i-1] && state[_position] <= xs[i+1]){
        //               carX = x;
        //               carXS = xs[i];
        //            }
        //            if (goal_position >= xs[i-1] && goal_position <= xs[i+1]){
        //               goalX = x;
        //               goalXS = xs[i];
        //            }
        //            x = x + 0.04;
        //         }
        //         glEnd();
        //
        //         //car
        //         glBegin(GL_LINES);
        //         glColor3f(1.0 ,0.0, 0.0);
        //         glVertex2d(carX,  (sin(3 * carXS) * .45 + .55) + 0.1);
        //         glVertex2d(carX, (sin(3 * carXS) * .45 + .55) - 0.1);
        //         glEnd();
        //
        //         //goal
        //         glBegin(GL_LINES);
        //         glColor3f(0.0 ,1.0, 0.0);
        //         glVertex2d(goalX,  (sin(3 * goalXS) * .45 + .55) + 0.1);
        //         glVertex2d(goalX, (sin(3 * goalXS) * .45 + .55) - 0.1);
        //         glEnd();
        //
        //         if (step > 0){
        //            double force = bound(actionC, min_action, max_action);
        //            glLineWidth(2.0);
        //            drawTrace(0, "Action:", force, -1.0);
        //         }
        //
        //         glColor3f(1.0 ,1.0, 1.0);
        //         glLineWidth(1.0);
        //         drawEpisodeStepCounter(episode, step, -1.9, -1.9);
        //
        //         char c[80];
        //         if (step == 0)
        //            sprintf(c, "MountainCarContinuous Initial Conditions%s", ":");
        //         else if (terminal())
        //            sprintf(c, "MountainCarContinuous Terminal%s", ":");
        //         else
        //            sprintf(c, "Mountain Car%s", ":");
        //         drawStrokeText(c, -1.9, -1.7, 0);
        //
        //         glFlush();
        //#endif
    }
};

#endif  // AUTOML_ZERO_RL_H_