#ifndef MYLISTMODEL_H
#define MYLISTMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include <vector>

enum DataRoles
{
    PropertyRole = Qt::UserRole + 1,
    ValueRole
};


class MyListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    MyListModel(QObject *parent = 0);


    Q_INVOKABLE virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    Q_INVOKABLE virtual int rowCount(const QModelIndex &parent) const override;
    Q_INVOKABLE int count();
    virtual QHash<int,QByteArray> roleNames() const;

private:
    using Pair_pr = std::pair<QString, QString>;
    std::vector<Pair_pr> m_data;
};

#endif // MYLISTMODEL_H
