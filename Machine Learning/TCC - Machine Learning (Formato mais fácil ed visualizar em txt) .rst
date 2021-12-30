.. code:: ipython3

    import pandas as pd
    import numpy as np
    import seaborn as sns 
    import matplotlib.pyplot as plt

.. code:: ipython3

    df = pd.read_csv('datatran.csv',sep=';',encoding='utf-8', low_memory=False, index_col = 0)

.. code:: ipython3

    df['risco'] = df.d_classificacaoacidente.apply(lambda x: 1 if x in ['Com Vítimas Feridas', 'Com Vítimas Fatais'] else 0)

.. code:: ipython3

    y = df['risco']

.. code:: ipython3

    X_cols = ['d_br', 'd_km', 'd_fasedia', 'd_diasemana', 'd_condicaometereologica']
    X = df[X_cols]

.. code:: ipython3

    filtro = X.d_br.value_counts()>99
    BR = filtro[filtro]
    X = X[X.d_br.isin(BR.index)]

.. code:: ipython3

    X['br']=X.d_br.astype(int)
    X['br']=X.d_br.astype(str)

.. code:: ipython3

    cols = ['d_br', 'd_km', 'd_fasedia', 'd_diasemana', 'd_condicaometereologica']
    X_pronto = pd.get_dummies(X[cols])

.. code:: ipython3

    y = y[X_pronto.index]

.. code:: ipython3

    from sklearn.model_selection import train_test_split
    
    X_train, X_test, y_train, y_test = train_test_split(X_pronto, y, random_state=42, test_size=0.30)

.. code:: ipython3

    from sklearn.neighbors import KNeighborsClassifier

.. code:: ipython3

    knn = KNeighborsClassifier()

.. code:: ipython3

    knn.fit(X_train, y_train)




.. parsed-literal::

    KNeighborsClassifier()



.. code:: ipython3

    from sklearn.linear_model import LogisticRegression

.. code:: ipython3

    lr = LogisticRegression()

.. code:: ipython3

    lr.fit(X_train, y_train)


.. parsed-literal::

    C:\Users\Micro\AppData\Local\Programs\Python\Python310\lib\site-packages\sklearn\linear_model\_logistic.py:814: ConvergenceWarning: lbfgs failed to converge (status=1):
    STOP: TOTAL NO. of ITERATIONS REACHED LIMIT.
    
    Increase the number of iterations (max_iter) or scale the data as shown in:
        https://scikit-learn.org/stable/modules/preprocessing.html
    Please also refer to the documentation for alternative solver options:
        https://scikit-learn.org/stable/modules/linear_model.html#logistic-regression
      n_iter_i = _check_optimize_result(
    



.. parsed-literal::

    LogisticRegression()



.. code:: ipython3

    y_preds = lr.predict(X_test)

.. code:: ipython3

    from sklearn.metrics import roc_auc_score

.. code:: ipython3

    y_preds=lr.predict_proba(X_test)

.. code:: ipython3

    y_preds=y_preds[:, 1]

.. code:: ipython3

    roc_lr = roc_auc_score(y_test.values, y_preds)
    print(roc_lr)


.. parsed-literal::

    0.5522569562348056
    

.. code:: ipython3

    from sklearn.metrics import confusion_matrix

.. code:: ipython3

    y_preds = lr.predict(X_test)

.. code:: ipython3

    cm_lr = confusion_matrix(y_test.values, y_preds)

.. code:: ipython3

    sns.heatmap(cm_lr, annot=True, fmt='d')
    plt.xlabel('Previsão')
    plt.ylabel('Ocorrido')




.. parsed-literal::

    Text(33.0, 0.5, 'Ocorrido')




.. image:: output_24_1.png


.. code:: ipython3

    from sklearn.neighbors import KNeighborsClassifier

.. code:: ipython3

    knn = KNeighborsClassifier()

.. code:: ipython3

    knn.fit(X_train, y_train)




.. parsed-literal::

    KNeighborsClassifier()



.. code:: ipython3

    y_preds=knn.predict_proba(X_test)
    y_preds=y_preds[:, 1]
    roc_knn = roc_auc_score(y_test.values, y_preds)
    print(roc_knn)


.. parsed-literal::

    0.5201999413380564
    

.. code:: ipython3

    y_preds=knn.predict(X_test)
    cm_knn = confusion_matrix(y_test.values, y_preds)

.. code:: ipython3

    sns.heatmap(cm_knn, annot=True, fmt='d')
    plt.xlabel('Previsão')
    plt.ylabel('Ocorrido')




.. parsed-literal::

    Text(33.0, 0.5, 'Ocorrido')




.. image:: output_30_1.png


.. code:: ipython3

    from sklearn.tree import DecisionTreeClassifier

.. code:: ipython3

    dtc = DecisionTreeClassifier()

.. code:: ipython3

    dtc.fit(X_train,y_train)




.. parsed-literal::

    DecisionTreeClassifier()



.. code:: ipython3

    y_preds=dtc.predict_proba(X_test)
    y_preds=y_preds[:, 1]
    roc_dtc = roc_auc_score(y_test.values, y_preds)
    print(roc_dtc)


.. parsed-literal::

    0.5108601899744482
    

.. code:: ipython3

    y_preds=dtc.predict(X_test)
    cm_dtc = confusion_matrix(y_test.values, y_preds)

.. code:: ipython3

    sns.heatmap(cm_dtc, annot=True, fmt='d')
    plt.xlabel('Previsão')
    plt.ylabel('Ocorrido')




.. parsed-literal::

    Text(33.0, 0.5, 'Ocorrido')




.. image:: output_36_1.png


.. code:: ipython3

    from sklearn.ensemble import GradientBoostingClassifier

.. code:: ipython3

    gb = GradientBoostingClassifier()

.. code:: ipython3

    gb.fit(X_train, y_train)




.. parsed-literal::

    GradientBoostingClassifier()



.. code:: ipython3

    y_preds=gb.predict_proba(X_test)
    y_preds=y_preds[:, 1]
    roc_gb = roc_auc_score(y_test.values, y_preds)
    print(roc_gb)


.. parsed-literal::

    0.5577306909136034
    

.. code:: ipython3

    y_preds=gb.predict(X_test)
    cm_gb = confusion_matrix(y_test.values, y_preds)

.. code:: ipython3

    sns.heatmap(cm_gb, annot=True, fmt='d')
    plt.xlabel('Previsão')
    plt.ylabel('Ocorrido')




.. parsed-literal::

    Text(33.0, 0.5, 'Ocorrido')




.. image:: output_42_1.png


.. code:: ipython3

    print(roc_lr, roc_knn, roc_dtc, roc_gb, roc_rf)


.. parsed-literal::

    0.5522569562348056 0.5201999413380564 0.5108601899744482 0.5577306909136034 0.5250403413673873
    

.. code:: ipython3

    from sklearn.ensemble import RandomForestClassifier

.. code:: ipython3

    rf = RandomForestClassifier()

.. code:: ipython3

    rf.fit(X_train, y_train)




.. parsed-literal::

    RandomForestClassifier()



.. code:: ipython3

    y_preds=rf.predict_proba(X_test)

.. code:: ipython3

    y_preds=y_preds[:, 1]

.. code:: ipython3

    roc_rf = roc_auc_score(y_test.values, y_preds)
    print(roc_rf)


.. parsed-literal::

    0.5250403413673873
    

.. code:: ipython3

    y_preds=rf.predict(X_test)

.. code:: ipython3

    cm_rf = confusion_matrix(y_test.values, y_preds)
    sns.heatmap(cm_rf, annot=True, fmt='g')
    plt.xlabel('Previsão')
    plt.ylabel('Ocorrido')




.. parsed-literal::

    Text(33.0, 0.5, 'Ocorrido')




.. image:: output_51_1.png


.. code:: ipython3

    result = {
        "Regressão Logistica": (roc_lr *100),
        "KNN": (roc_knn *100),
        "Decision Tree": (roc_dtc *100),
        "Gradient Boosting": (roc_gb *100),
        "Random Forest": (roc_rf *100)
    }

.. code:: ipython3

    import matplotlib.pyplot as plt
    sns.set_palette("Set2",5, .95)
    
    plt.barh(*zip(*result.items()))
    plt.show()



.. image:: output_53_0.png


