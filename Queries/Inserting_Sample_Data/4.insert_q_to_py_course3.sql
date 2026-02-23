USE ExamsSystem;
GO

-- ============================================================================
-- PART 1: 40 MULTIPLE CHOICE QUESTIONS (MCQ) - Degree: 2
-- ============================================================================

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which Python library is most commonly used for numerical arrays?', 
    @CorrectAnswer = 'NumPy', 
    @WrongAnswers = 'Requests,BeautifulSoup,Flask';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is the primary data structure in pandas for tabular data?', 
    @CorrectAnswer = 'DataFrame', 
    @WrongAnswers = 'SeriesList,MatrixTable,TupleGrid';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which method is used to read a CSV file in pandas?', 
    @CorrectAnswer = 'read_csv()', 
    @WrongAnswers = 'load_csv(),open_csv(),import_csv()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which attribute returns the number of rows and columns in a DataFrame?', 
    @CorrectAnswer = 'shape', 
    @WrongAnswers = 'size,count,axes';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which pandas function is used to merge two DataFrames by keys?', 
    @CorrectAnswer = 'merge()', 
    @WrongAnswers = 'join_data(),combine(),concat_rows()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'What does NaN represent in pandas?', 
    @CorrectAnswer = 'Missing value', 
    @WrongAnswers = 'Negative number,Named array node,Normalized axis number';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which function displays the first five rows of a DataFrame by default?', 
    @CorrectAnswer = 'head()', 
    @WrongAnswers = 'first(),top(),preview()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which function summarizes numerical columns with count, mean, and std?', 
    @CorrectAnswer = 'describe()', 
    @WrongAnswers = 'summary(),stats(),profile()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which matplotlib module is usually imported as plt?', 
    @CorrectAnswer = 'matplotlib.pyplot', 
    @WrongAnswers = 'matplotlib.plot,matplotlib.graph,seaborn.pyplot';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which seaborn function creates a scatter plot with optional hue grouping?', 
    @CorrectAnswer = 'scatterplot()', 
    @WrongAnswers = 'pointmap(),dots(),plot_scatter()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'What does df.dropna() do by default?', 
    @CorrectAnswer = 'Removes rows containing missing values', 
    @WrongAnswers = 'Replaces missing values with zero,Deletes duplicate rows,Converts NaN to string';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which method removes duplicate rows in a DataFrame?', 
    @CorrectAnswer = 'drop_duplicates()', 
    @WrongAnswers = 'unique_rows(),dedupe(),remove_dups()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which pandas function is used to concatenate DataFrames vertically?', 
    @CorrectAnswer = 'concat()', 
    @WrongAnswers = 'append_df(),stack_df(),merge_rows()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which method is used to sort a DataFrame by a column?', 
    @CorrectAnswer = 'sort_values()', 
    @WrongAnswers = 'order_by(),arrange(),sort_column()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which indexer is label-based in pandas?', 
    @CorrectAnswer = 'loc', 
    @WrongAnswers = 'iloc,ixs,at_row';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which indexer is integer-position based in pandas?', 
    @CorrectAnswer = 'iloc', 
    @WrongAnswers = 'loc,at,labeloc';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is the output of len(df) for a DataFrame?', 
    @CorrectAnswer = 'Number of rows', 
    @WrongAnswers = 'Number of columns,Total cells,Memory size in bytes';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which NumPy function creates an array of zeros?', 
    @CorrectAnswer = 'zeros()', 
    @WrongAnswers = 'nulls(),empty_like(),blank()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which NumPy function generates evenly spaced values within an interval?', 
    @CorrectAnswer = 'linspace()', 
    @WrongAnswers = 'rangef(),steps(),spread()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which operation computes element-wise multiplication in NumPy arrays?', 
    @CorrectAnswer = 'Using the * operator', 
    @WrongAnswers = 'Using x,Using dot by default,Using multiply_rows()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which function computes the mean of a NumPy array?', 
    @CorrectAnswer = 'np.mean()', 
    @WrongAnswers = 'np.avg(),np.middle(),np.center()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which package in scikit-learn contains train_test_split?', 
    @CorrectAnswer = 'sklearn.model_selection', 
    @WrongAnswers = 'sklearn.preprocessing,sklearn.metrics,sklearn.pipeline';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is the purpose of train_test_split?', 
    @CorrectAnswer = 'Split data into training and testing sets', 
    @WrongAnswers = 'Normalize all features,Remove outliers,Encode categorical labels';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which class implements linear regression in scikit-learn?', 
    @CorrectAnswer = 'LinearRegression', 
    @WrongAnswers = 'LogisticRegressionCV,RegressorLinear,LeastSquaresModel';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which metric measures average absolute error?', 
    @CorrectAnswer = 'MAE', 
    @WrongAnswers = 'MSE,R2,RMSE2';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which metric is commonly used for classification accuracy?', 
    @CorrectAnswer = 'accuracy_score', 
    @WrongAnswers = 'mean_squared_error,r2_score,silhouette_score';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which preprocessing transformer is used for standardization?', 
    @CorrectAnswer = 'StandardScaler', 
    @WrongAnswers = 'NormalizerMax,MinCenter,RangeEncoder';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'What does StandardScaler do?', 
    @CorrectAnswer = 'Centers features and scales to unit variance', 
    @WrongAnswers = 'Only removes outliers,Only encodes strings,Converts floats to integers';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which model is suitable for binary classification?', 
    @CorrectAnswer = 'LogisticRegression', 
    @WrongAnswers = 'LinearRegression,KMeans,PCA';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which algorithm is unsupervised clustering?', 
    @CorrectAnswer = 'KMeans', 
    @WrongAnswers = 'RandomForestClassifier,LinearRegression,DecisionTreeRegressor';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which method trains a scikit-learn model?', 
    @CorrectAnswer = 'fit()', 
    @WrongAnswers = 'train(),learn(),build()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which method generates predictions from a trained model?', 
    @CorrectAnswer = 'predict()', 
    @WrongAnswers = 'forecast(),infer(),classify_all()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which visualization is best for distribution of one numeric variable?', 
    @CorrectAnswer = 'Histogram', 
    @WrongAnswers = 'Pie chart,Tree map,Bubble map';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which plot is commonly used to detect outliers?', 
    @CorrectAnswer = 'Box plot', 
    @WrongAnswers = 'Line plot,Area plot,Radar plot';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which correlation coefficient in pandas is default for corr()?', 
    @CorrectAnswer = 'Pearson', 
    @WrongAnswers = 'Spearman,Kendall,Euclidean';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which pandas function creates a pivot table?', 
    @CorrectAnswer = 'pivot_table()', 
    @WrongAnswers = 'pivot_data(),cross_tabulate(),group_matrix()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which method converts a DataFrame column to datetime?', 
    @CorrectAnswer = 'pd.to_datetime()', 
    @WrongAnswers = 'pd.as_date(),pd.convert_time(),pd.make_datetime()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which statement selects rows where age is greater than 30?', 
    @CorrectAnswer = 'df[df["age"] > 30]', 
    @WrongAnswers = 'df.where(age > 30,df.select(age > 30),df.filter(age > 30)';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which pandas method applies a function along an axis of a DataFrame?', 
    @CorrectAnswer = 'apply()', 
    @WrongAnswers = 'map_all(),use(),for_each()';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which method writes a DataFrame to a CSV file?', 
    @CorrectAnswer = 'to_csv()', 
    @WrongAnswers = 'write_csv(),save_text(),export_table()';

-- ============================================================================
-- PART 2: 30 TRUE/FALSE QUESTIONS (TF) - Degree: 1
-- ============================================================================

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Python uses indentation to define code blocks.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'A pandas Series is one-dimensional labeled data.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'NumPy arrays can only store integers.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'The pandas read_excel() function can load Excel files.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'dropna() fills missing values with the column mean by default.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'fillna() is used to replace missing values in pandas.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'In matplotlib, plt.show() renders the current figure.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Seaborn cannot work with pandas DataFrames directly.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'train_test_split helps estimate model performance on unseen data.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Overfitting means the model performs better on test data than on training data.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Logistic Regression outputs class probabilities for classification tasks.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'KMeans requires specifying the number of clusters in advance.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Linear Regression is mainly used for clustering unlabeled data.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'StandardScaler should be fitted on training data only.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Accuracy is always the best metric for imbalanced classes.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'A confusion matrix summarizes true and false predictions by class.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'PCA is often used for dimensionality reduction.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'PCA is a supervised learning algorithm that needs target labels.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'The value_counts() method is useful for categorical frequency analysis.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'A box plot is mainly used to show relationships between two categorical variables.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Boolean indexing can filter rows in a pandas DataFrame.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'The groupby() operation is commonly used with aggregate functions.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'concat() can only combine DataFrames horizontally.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'The random_state parameter helps make experiments reproducible.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Cross-validation gives a more robust estimate than a single train-test split.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Mean squared error is a classification metric.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'ROC-AUC evaluates ranking quality across classification thresholds.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'Precision measures all actual positives that were correctly identified.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Recall is important when false negatives are costly.';

EXEC sp_AddQuestion @CourseID = 3, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'A pipeline helps chain preprocessing and modeling steps safely.';

-- ============================================================================
-- PART 3: 30 TEXT / ESSAY QUESTIONS - Degree: 5
-- ============================================================================

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Explain the difference between a pandas Series and a DataFrame.', 
    @Keywords = 'one-dimensional,two-dimensional,labels,columns,index';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'What are common strategies for handling missing values in a dataset?', 
    @Keywords = 'drop,imputation,mean,median,mode,domain';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Describe when you would use normalization versus standardization.', 
    @Keywords = 'scale,range,variance,distance,algorithm';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Why is train-test splitting important in machine learning workflows?', 
    @Keywords = 'generalization,leakage,evaluation,unseen,bias';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'How does overfitting happen and how can it be reduced?', 
    @Keywords = 'complexity,regularization,cross-validation,noise,variance';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Explain bias-variance tradeoff in predictive modeling.', 
    @Keywords = 'underfitting,overfitting,error,generalization,complexity';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'What is feature engineering and why does it matter?', 
    @Keywords = 'transformation,domain,signal,performance,model';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Describe one-hot encoding and when to apply it.', 
    @Keywords = 'categorical,binary,dummy,columns,representation';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'What is data leakage and give an example in preprocessing.', 
    @Keywords = 'future,information,split,fit,contamination';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Compare MAE, MSE, and RMSE for regression evaluation.', 
    @Keywords = 'error,penalty,units,squared,interpretation';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'When would you prefer precision over recall?', 
    @Keywords = 'false-positive,cost,classification,threshold,tradeoff';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'When would you prefer recall over precision?', 
    @Keywords = 'false-negative,risk,detection,classification,sensitivity';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Explain how a confusion matrix helps analyze model errors.', 
    @Keywords = 'tp,tn,fp,fn,diagnostics';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'What is cross-validation and why is it useful?', 
    @Keywords = 'folds,robust,variance,evaluation,resampling';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Describe the steps of a typical end-to-end data science project in Python.', 
    @Keywords = 'collect,clean,explore,model,evaluate,deploy';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'How do you detect and treat outliers in numerical data?', 
    @Keywords = 'iqr,z-score,winsorize,domain,robust';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Explain the difference between loc and iloc in pandas.', 
    @Keywords = 'labels,positions,indexing,selection,slicing';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'What are the benefits of using vectorized operations in NumPy and pandas?', 
    @Keywords = 'performance,looping,optimized,memory,readability';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'How would you join two datasets in pandas and what keys are needed?', 
    @Keywords = 'merge,join,key,cardinality,integrity';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'What is the role of exploratory data analysis before modeling?', 
    @Keywords = 'patterns,quality,hypothesis,visualization,assumptions';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'How can visualization reveal skewness and multimodality?', 
    @Keywords = 'histogram,kde,distribution,shape,modes';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Explain the purpose of pipelines in scikit-learn.', 
    @Keywords = 'sequence,preprocessing,model,leakage,reproducibility';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Why is reproducibility important in data science experiments?', 
    @Keywords = 'random_state,environment,tracking,repeatability,trust';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'How do class imbalance problems affect model evaluation?', 
    @Keywords = 'minority,accuracy,precision,recall,roc-auc';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'What is ROC curve and what does AUC represent?', 
    @Keywords = 'threshold,tpr,fpr,ranking,area';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Compare supervised and unsupervised learning with examples.', 
    @Keywords = 'labels,classification,regression,clustering,patterns';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Explain principal component analysis at a high level.', 
    @Keywords = 'variance,projection,components,dimensionality,reduction';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'How does regularization improve generalization in linear models?', 
    @Keywords = 'lasso,ridge,penalty,weights,overfitting';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'What checks would you perform before deploying a trained model?', 
    @Keywords = 'validation,drift,monitoring,latency,fairness';

EXEC sp_AddQuestion 
    @CourseID = 3, @QType = 'Text', @Degree = 5,
    @QText = 'Describe best practices for documenting a data science notebook.', 
    @Keywords = 'assumptions,steps,results,versioning,communication';

-------------Adding new Exam with these questions-----------------------------
EXEC sp_CreateRandomExam 
    @CourseID = 3,               -- Add Questoins related to CourseID = 3 Python for Data Science
    @ClassID = 3,                -- Class 3 is linked to Course 3(Python for Data Science - Class 3 (2026))
    @StartTime = '00:00:00',     -- Start of day
    @EndTime = '23:59:59',       -- End of day
    @ExamType = 'Normal',        -- Matches your CHECK constraint
    @Allowance = 'Paper_Sheet',
    @ExamDate = '2026-04-08',    -- Date requested
    @NumMCQ = 10,                -- Pulls MCQ questions
    @NumTF = 20,                 -- Pulls True/False questions
    @NumText = 10;               -- Pulls Text questions
GO

