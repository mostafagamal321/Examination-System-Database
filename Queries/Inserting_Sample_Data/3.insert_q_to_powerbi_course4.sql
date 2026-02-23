USE ExamsSystem;
GO

-- ============================================================================
-- PART 1: 40 MULTIPLE CHOICE QUESTIONS (MCQ) - Degree: 2
-- ============================================================================

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is the primary language used for measures in Power BI?', 
    @CorrectAnswer = 'DAX', 
    @WrongAnswers = 'M,SQL,Python';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which Power BI component is used to clean and transform data?', 
    @CorrectAnswer = 'Power Query Editor', 
    @WrongAnswers = 'Data Catalog,Model Viewer,Visual Designer';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which language is used in Power Query transformations?', 
    @CorrectAnswer = 'M', 
    @WrongAnswers = 'DAX,R,Scala';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which visual is most suitable for showing trends over time?', 
    @CorrectAnswer = 'Line chart', 
    @WrongAnswers = 'Pie chart,Card,Slicer';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What does a slicer do in Power BI?', 
    @CorrectAnswer = 'Filters report visuals interactively', 
    @WrongAnswers = 'Creates a new table,Publishes dataset,Calculates totals';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which relationship cardinality indicates many rows on both sides?', 
    @CorrectAnswer = 'Many-to-many', 
    @WrongAnswers = 'One-to-one,One-to-many,Many-to-one';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which DAX function returns the total of a numeric column?', 
    @CorrectAnswer = 'SUM()', 
    @WrongAnswers = 'TOTAL(),ADD(),COUNT()';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which DAX function counts nonblank rows in a column?', 
    @CorrectAnswer = 'COUNTA()', 
    @WrongAnswers = 'COUNTX(),COUNTBLANK(),COUNTROWS()';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is the purpose of CALCULATE in DAX?', 
    @CorrectAnswer = 'Modify filter context for an expression', 
    @WrongAnswers = 'Create relationships,Load data sources,Format visuals';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which Power BI view is used to define relationships between tables?', 
    @CorrectAnswer = 'Model view', 
    @WrongAnswers = 'Report view,Query view,Dashboard view';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What does star schema usually contain at the center?', 
    @CorrectAnswer = 'Fact table', 
    @WrongAnswers = 'Date dimension,Bridge table,Calculated table';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which table type typically stores descriptive attributes?', 
    @CorrectAnswer = 'Dimension table', 
    @WrongAnswers = 'Fact table,Measure table,Log table';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which option is used to remove duplicate rows in Power Query?', 
    @CorrectAnswer = 'Remove Duplicates', 
    @WrongAnswers = 'Drop Nulls,Delete Keys,Unique Measure';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which function is used to create a new column based on conditions in DAX?', 
    @CorrectAnswer = 'IF()', 
    @WrongAnswers = 'CASE(),WHEN(),SWITCHROW()';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What does ALL() do in DAX?', 
    @CorrectAnswer = 'Removes filters from specified columns or tables', 
    @WrongAnswers = 'Applies all filters,Returns all visuals,Loads all sources';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which DAX function returns current year from a date value?', 
    @CorrectAnswer = 'YEAR()', 
    @WrongAnswers = 'DATEYEAR(),CURYEAR(),YYYY()';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is a measure in Power BI?', 
    @CorrectAnswer = 'A dynamic calculation evaluated by context', 
    @WrongAnswers = 'A fixed stored column,A visual formatting rule,A data source connection';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is a calculated column in Power BI?', 
    @CorrectAnswer = 'A column computed row by row and stored in the model', 
    @WrongAnswers = 'A runtime-only metric,A report filter,A query parameter';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which storage mode imports data into the Power BI model?', 
    @CorrectAnswer = 'Import', 
    @WrongAnswers = 'DirectQuery,LiveConnect,HybridFilter';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which storage mode queries source data at runtime?', 
    @CorrectAnswer = 'DirectQuery', 
    @WrongAnswers = 'Import,Snapshot,Embedded';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which feature lets you create reusable metric definitions in enterprise models?', 
    @CorrectAnswer = 'Measures', 
    @WrongAnswers = 'Bookmarks,Themes,Slicers';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which visual is best for displaying one KPI number?', 
    @CorrectAnswer = 'Card', 
    @WrongAnswers = 'Scatter chart,Treemap,Matrix';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which visual is suitable for hierarchical data exploration?', 
    @CorrectAnswer = 'Decomposition tree', 
    @WrongAnswers = 'Gauge,Card,Donut chart';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is the purpose of bookmarks in Power BI?', 
    @CorrectAnswer = 'Capture report view state for navigation or storytelling', 
    @WrongAnswers = 'Store source credentials,Create relationships,Compress data model';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which pane is used to control interaction behavior between visuals?', 
    @CorrectAnswer = 'Edit interactions', 
    @WrongAnswers = 'Sync slicers,Selection pane,Data source settings';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What does row-level security (RLS) control?', 
    @CorrectAnswer = 'Which data rows each user can see', 
    @WrongAnswers = 'Which visuals each user can edit,Who can install Power BI Desktop,Dataset refresh interval';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Where are Power BI dashboards created?', 
    @CorrectAnswer = 'Power BI Service', 
    @WrongAnswers = 'Power BI Desktop only,Power Query Editor only,SQL Server Agent';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is a workspace in Power BI Service?', 
    @CorrectAnswer = 'A collaborative container for content', 
    @WrongAnswers = 'A local cache file,A data type,A single visual';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which object can include one or more reports and a dataset for distribution?', 
    @CorrectAnswer = 'App', 
    @WrongAnswers = 'Theme,Slicer,Gateway';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What does a data gateway enable?', 
    @CorrectAnswer = 'Secure access to on-premises data from Power BI Service', 
    @WrongAnswers = 'DAX formula optimization,Visual animation,Desktop installation';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which Power BI feature allows periodic data refresh in the service?', 
    @CorrectAnswer = 'Scheduled refresh', 
    @WrongAnswers = 'Auto save,Snapshot mode,Data profiler';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which file extension is used for a Power BI Desktop report?', 
    @CorrectAnswer = '.pbix', 
    @WrongAnswers = '.pbitx,.xlsx,.rdl';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which file type is a Power BI template file?', 
    @CorrectAnswer = '.pbit', 
    @WrongAnswers = '.pbix,.pbid,.dax';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is the purpose of drill-through in Power BI?', 
    @CorrectAnswer = 'Navigate to a detailed page filtered by selected context', 
    @WrongAnswers = 'Merge tables,Schedule refresh,Create a new workspace';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which DAX function can return a filtered table expression?', 
    @CorrectAnswer = 'FILTER()', 
    @WrongAnswers = 'WHERE(),SELECT(),QUERY()';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which DAX function is often used to rank values?', 
    @CorrectAnswer = 'RANKX()', 
    @WrongAnswers = 'ORDERBY(),SORTX(),TOPRANK()';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which DAX function returns the distinct count of values?', 
    @CorrectAnswer = 'DISTINCTCOUNT()', 
    @WrongAnswers = 'UNIQUECOUNT(),COUNTUNIQUE(),COUNTDISTINCTROWS()';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'What does RELATED() do in DAX?', 
    @CorrectAnswer = 'Fetches a value from a related table', 
    @WrongAnswers = 'Creates a relationship,Removes relationships,Aggregates all related rows';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which panel is used to organize and hide report page objects?', 
    @CorrectAnswer = 'Selection pane', 
    @WrongAnswers = 'Data pane,Filters pane,Performance pane';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which feature applies consistent colors and styles to a report?', 
    @CorrectAnswer = 'Theme', 
    @WrongAnswers = 'Bookmark,RLS,Gateway';

-- ============================================================================
-- PART 2: 30 TRUE/FALSE QUESTIONS (TF) - Degree: 1
-- ============================================================================

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Power BI Desktop is used to build reports and data models.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'DAX measures are evaluated based on filter context.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Power Query transformations are written in DAX by default.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'A many-to-one relationship is common between fact and dimension tables.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Calculated columns are always more efficient than measures.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'DirectQuery sends queries to the underlying source at runtime.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Import mode stores data in the Power BI model.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'RLS can be configured only in Power BI Desktop and never in the service.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'A slicer can filter multiple visuals on a report page.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'A card visual is best for displaying detailed transaction tables.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Star schema design usually improves model usability and performance.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Bookmarks can capture filter and visibility states.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'ALL() adds extra filters to current context.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'CALCULATE can change how filters apply to an expression.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'DISTINCTCOUNT is useful when counting unique customers.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Power BI reports cannot connect to Excel files.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Scheduled refresh in the service keeps imported datasets updated.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'A gateway is required for refreshing many on-premises data sources.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Power BI Service is only for viewing and cannot share content.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Apps in Power BI help distribute curated reports to users.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Report themes can change data values in visuals.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Drill-down allows navigation through hierarchy levels in a visual.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Drill-through can pass filter context to a target page.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'M language is used to create report-level tooltips in visuals.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Power Query steps are applied sequentially in the query editor.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Many-to-many relationships always guarantee clear filtering results.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Performance Analyzer can help identify slow visuals in a report.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'RANKX can only rank text values and not numbers.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'A .pbit file stores report structure without embedded data.';

EXEC sp_AddQuestion @CourseID = 4, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Using unnecessary high-cardinality columns can increase model size.';

-- ============================================================================
-- PART 3: 30 TEXT / ESSAY QUESTIONS - Degree: 5
-- ============================================================================

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Explain the difference between DAX and M in Power BI.', 
    @Keywords = 'dax,m,power-query,model,calculation,transformation';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Describe star schema and why it is recommended in Power BI models.', 
    @Keywords = 'fact,dimension,relationship,performance,usability';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'What is filter context in DAX and how does it affect measures?', 
    @Keywords = 'filter-context,measure,evaluation,slicer,visual';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'When would you use a calculated column instead of a measure?', 
    @Keywords = 'row-level,storage,context,modeling,tradeoff';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'How does CALCULATE change the behavior of a DAX expression?', 
    @Keywords = 'calculate,filter,context-transition,expression';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Explain row-level security and provide a practical use case.', 
    @Keywords = 'rls,role,security,filter,user';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'What steps do you take in Power Query to clean messy source data?', 
    @Keywords = 'trim,replace,datatype,remove-duplicates,nulls';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Compare Import mode and DirectQuery with key pros and cons.', 
    @Keywords = 'import,directquery,latency,size,refresh';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'How can a gateway be configured for reliable scheduled refresh?', 
    @Keywords = 'gateway,credentials,refresh,on-premises,service';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Describe best practices for building performant Power BI reports.', 
    @Keywords = 'performance,model,dax,visuals,cardinality';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'How do slicers and cross-filtering improve report interactivity?', 
    @Keywords = 'slicer,interaction,filter,ux,analysis';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Explain drill-down versus drill-through with an example.', 
    @Keywords = 'hierarchy,detail,navigation,context';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'What are bookmarks and how can they support storytelling?', 
    @Keywords = 'bookmarks,navigation,state,storytelling';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'How do you design a dashboard for executive KPIs in Power BI Service?', 
    @Keywords = 'kpi,card,tiles,executive,service';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Why is data type management important in Power Query and modeling?', 
    @Keywords = 'data-type,quality,aggregation,dax,errors';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Describe how to use measures for year over year sales analysis.', 
    @Keywords = 'time-intelligence,year-over-year,measure,calendar';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'What is the role of a dedicated date table in Power BI models?', 
    @Keywords = 'date-table,time-intelligence,calendar,relationships';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'How can you troubleshoot ambiguous relationships in the model?', 
    @Keywords = 'relationships,ambiguity,filter-direction,model';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Explain bi-directional filtering and when to avoid it.', 
    @Keywords = 'bidirectional,filter,ambiguity,performance';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'How does DISTINCTCOUNT differ from COUNT in business reporting?', 
    @Keywords = 'distinct,count,unique,customer,metric';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'What techniques reduce report load time for large datasets?', 
    @Keywords = 'aggregation,incremental-refresh,optimization,model-size';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Describe incremental refresh and when it should be used.', 
    @Keywords = 'incremental-refresh,partitions,history,performance';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'How do you validate DAX measure correctness during development?', 
    @Keywords = 'validation,test,context,expected-results';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'What governance practices help manage shared datasets and reports?', 
    @Keywords = 'governance,workspace,ownership,certification,security';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'How would you implement role-based report access in an organization?', 
    @Keywords = 'roles,rls,workspace,permissions,app';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Explain the difference between report, dashboard, and dataset.', 
    @Keywords = 'report,dashboard,dataset,service,desktop';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'What common mistakes cause incorrect totals in matrix visuals?', 
    @Keywords = 'totals,context,dax,matrix,aggregation';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'How can tooltips be used to add detail without cluttering the page?', 
    @Keywords = 'tooltip,detail,design,ux,context';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'Describe a process to publish, test, and deploy a Power BI solution.', 
    @Keywords = 'publish,test,workspace,app,release';

EXEC sp_AddQuestion 
    @CourseID = 4, @QType = 'Text', @Degree = 5,
    @QText = 'What documentation should accompany a production Power BI report?', 
    @Keywords = 'documentation,assumptions,measures,data-source,lineage';

-------------Adding new Exam with these questions-----------------------------
EXEC sp_CreateRandomExam 
    @CourseID = 4,               -- Add Questoins related to CourseID = 4 Power BI Modeling
    @ClassID = 2,                -- Class 2 is linked to Course 4 (Power BI Modeling - Class 2 (2026))
    @StartTime = '00:00:00',     -- Start of day
    @EndTime = '23:59:59',       -- End of day
    @ExamType = 'Normal',        -- Matches your CHECK constraint
    @Allowance = 'Paper_Sheet',
    @ExamDate = '2026-04-08',    -- Date requested
    @NumMCQ = 10,                -- Pulls MCQ questions
    @NumTF = 20,                 -- Pulls True/False questions
    @NumText = 10;               -- Pulls Text questions
GO

