#pragma once

#include <QAbstractListModel>
#include <QObject>
#include <vector>

enum DataRoles
{
    Role1 = Qt::UserRole + 1,
    Role2
};


class MyListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    MyListModel(QObject *parent = nullptr);


    Q_INVOKABLE virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    Q_INVOKABLE virtual int rowCount(const QModelIndex &parent) const override;
    virtual QHash<int,QByteArray> roleNames() const override;

private:
    using Pair_pr = std::pair<QString, QString>;
    std::vector<Pair_pr> m_data;
};
