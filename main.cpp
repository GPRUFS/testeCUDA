#include <iostream>
#include <ctime>
#include <cmath>
#include "bits/time.h"

#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>

#include <opencv2/core/cuda.hpp>
#include <opencv2/cudaarithm.hpp>
#include <opencv2/cudaimgproc.hpp>

#define TestCUDA false

int main() {
    std::clock_t begin = std::clock();

        try {
            cv::String filename = "/home/gprufs/Imagens/tela.png";
            cv::Mat srcHost = cv::imread(filename, cv::IMREAD_GRAYSCALE);

            for(int i=0; i<1000; i++)
            {
                    cv::cuda::GpuMat dst, src;
                    src.upload(srcHost);

                   // cv::cuda::threshold(src,dst,128.0,255.0, cv::THRESH_BINARY);
                    cv::cuda::bilateralFilter(src,dst,3,1,1);

                    cv::Mat resultHost;
                    dst.download(resultHost);
            }

            //cv::imshow("Result",resultHost);
            //cv::waitKey();

        } catch(const cv::Exception& ex) {
            std::cout << "Error: " << ex.what() << std::endl;
        }

    std::clock_t end = std::clock();
    std::cout <<"Com cuda"<<std::endl;
    std::cout << double(end-begin) / CLOCKS_PER_SEC  << std::endl;
    begin = std::clock();

        try {
            cv::String filename2 = "/home/gprufs/Imagens/tela.png";
            cv::Mat srcHost2 = cv::imread(filename2, cv::IMREAD_GRAYSCALE);

            for(int i=0; i<1000; i++)
            {
                {
                    cv::Mat dst2;
                    cv::bilateralFilter(srcHost2,dst2,3,1,1);
                }
            }

            //cv::imshow("Result",resultHost);
            //cv::waitKey();

        } catch(const cv::Exception& ex) {
            std::cout << "Error: " << ex.what() << std::endl;
        }

    end = std::clock();
    std::cout <<"Sem cuda"<<std::endl;
    std::cout << double(end-begin) / CLOCKS_PER_SEC  << std::endl;
}
