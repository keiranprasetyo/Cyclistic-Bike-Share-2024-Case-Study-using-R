# Cyclistic Bike Share 2024 - A Case Study
## Introduction
This capstone project, part of my Google Data Analytics Professional Certificate course, involves analyzing historical data from Cyclistic, a fictional bike-share company. Utilized the R programming language and the RStudio IDE, I will leverage their powerful statistical analysis and data visualization capabilities to uncover trends in customer usage patterns.

For a comprehensive analysis, the following steps will be taken:
1. Ask
2. Prepare
3. Process
4. Analyze
5. Share
6. Act

## Scenario
You are a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Tools
R programming language and the RStudio IDE

## Step 1 : Ask
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

## Step 2 : Prepare
### Data Sources
The analysis utilizes historical trip data from Cyclistic, provided by Motivate International Inc. under a public [license](https://divvybikes.com/data-license-agreement). This dataset includes detailed trip information such as ride IDs, bike types, start and end times, station details, and rider membership types. For this analysis, data from August 2023 to July 2024 has been downloaded and extracted into twelve .CSV files. These files have been combined into a single table for analysis using the R programming language and the RStudio IDE. The dataset is publicly available and can be accessed [here](https://divvy-tripdata.s3.amazonaws.com/index.html).

## STEP 3: PROCESS
The third step in the data analysis journey is to process and clean the data. This phase involves identifying and correcting inaccuracies, errors, and inconsistencies in the data to ensure reliability and accuracy. By removing "bad data," we avoid skewed results and maintain the credibility of our analysis.

### Process
In this section, I will gather, clean, and prepare the data for analysis. This involves conducting various checks to confirm the data's integrity and readiness for analysis. Each step of this process will be meticulously documented to facilitate review and sharing.

#### Key Tasks
- Identify and correct errors in the data.
- Select appropriate tools for data processing.
- Transform the data for effective analysis.
- Document each step of the cleaning process.

The following R code snippets will demonstrate the execution of these tasks.

#### Deliverable
A comprehensive documentation of all data cleaning and manipulation steps, supported by R code snippets provided in this section.

## STEP 4: ANALYSIS
The fourth phase focuses on analyzing the data to uncover trends, patterns, and relationships that will help achieve the main business goal. During this phase, the data is further sorted and formatted to understand how different groups function individually and in relation to one another, drawing powerful insights. This phase is all about discovering the story the data is telling.

### Key Tasks:
- Aggregate the data** to make it useful and accessible.
- Organize and format the data** for analysis.
- Perform calculations** to derive meaningful information.
- Identify trends and relationships** within the data.

### Deliverable:
- A comprehensive summary of the analysis.

The following R code chunks in this section will perform these tasks and help generate valuable insights from the data.

## STEP 5: SHARE
In this phase, we focus on sharing our data findings through impactful visualizations. By creating graphs and plots, we can convey our results more effectively and ensure that our audience grasps the patterns and insights with ease. We'll use ggplot2 to visualize key metrics such as the total number of rides and the average ride duration for each member type.

### Share
Having completed our analysis and gathered significant insights, it's now time to present our findings in a clear and engaging manner.

#### Key Tasks:
1. Determine the Best Way to Share Findings
2. Create Effective Data Visualizations
3. Present Findings
4. Ensure Accessibility

#### Deliverable:
Our deliverable will include supporting visualizations and a summary of our key findings. We will present each main finding along with its corresponding visualization to ensure our points are effectively communicated.

### Summary of Findings:
Examined bike usage data from August 2023 to July 2024 to discern patterns in the behavior of annual members versus casual riders on Cyclistic bikes. The bar graphs provided highlight the distinctions in usage between these two groups, leading to the following insights:
1. Annual members use bikes more frequently than casual riders. Although their average ride durations are shorter, annual members demonstrate consistent riding patterns throughout the week. In contrast, casual riders show variability in ride lengths across different days of the week.
2. Annual members typically ride more during the weekdays, whereas casual riders favor weekends for their trips. Although annual members have shorter ride durations, they show a consistent pattern in their ride times throughout the week. Conversely, casual riders exhibit varying ride lengths depending on the day of the week.
3. The peak season for bike trips typically occurs in July, August, and September. This trend is expected, as these months are within the summer period when daylight hours are longer, encouraging more outdoor activities.

## STEP 6: ACT
### Final Insights and Recommendations:
With the analysis complete and results in hand, we are now ready to present our findings to the Cyclistic Executive Team and the Director of Marketing. Our analysis has revealed key differences in the usage patterns between casual riders and annual members. Based on these insights, here are my recommendations for the marketing team to convert more casual riders into annual members:

#### How are they utilizing the bikes?:
- Create weekend passes for diverse activities and events, providing users with additional flexibility.
- Identify popular locations frequented by casual riders using mapping tools, collaborate with these locations to set up promotional booths, and offer discounts on memberships paired with entertainment packages.

#### Seasonal Patterns:
- Arrange early bird incentives and special promotions for those who enroll ahead of the busy period, with discounted rates for early sign-ups. Highlight the perks of becoming an annual member versus remaining a casual rider. Begin an email campaign for casual riders in early Spring and run it through the Summer.
- Introduce summer passes to leverage the peak bike trip season in July, August, and September. With longer daylight hours encouraging more outdoor activity, these passes will attract more riders, boost usage, and help manage increased demand efficiently.

#### Marketing Events:
- Create a marketing event such as a long-distance bicycle race or group cycling in high-interest areas to promote healthier lifestyles and a more sustainable urban environment. This event will encourage physical activity, highlight the environmental benefits of cycling, and strengthen community connections.
- Collaborate with healthy food and beverage brands to highlight the benefits of cycling daily throughout the week. This partnership can effectively showcase how regular biking, combined with a nutritious diet, contributes to overall well-being and a healthier lifestyle.
- Utilize digital marketing channels to promote biking as a weekday transportation option. This strategy encourages better physical fitness, reduces traffic congestion, and lowers carbon emissions, leading to a healthier lifestyle and a more eco-conscious urban environment.






