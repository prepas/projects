#include "MyListModel.h"

MyListModel::MyListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    for (int j = 0; j < 30; ++j)
    {
        if (j % 3 == 0)
        {
            Pair_pr pr;
            pr.first = QString("Very looooong");
            pr.second = QString("striiiing");
            m_data.push_back(pr);
        }
        else
        {
            Pair_pr pr;
            pr.first = QString("MyData");
            pr.second = QString("string");
            m_data.push_back(pr);
        }
    }
}

QVariant MyListModel::data(const QModelIndex& index, int role) const
{
    const size_t row = static_cast<size_t>(index.row());
    if ( !index.isValid() || index.row() < 0 || row >= m_data.size() )
    {
        return QVariant();
    }
    const Pair_pr& modelEntry = m_data[row];
    if (role == PropertyRole)
    {
        return modelEntry.first;
    }
    if (role == ValueRole)
    {
        return modelEntry.second;
    }
    return QVariant();
}

int MyListModel::rowCount(const QModelIndex& /*parent*/) const
{
    return static_cast<int>(m_data.size());
}

int MyListModel::count()
{
    return rowCount(QModelIndex());
}

QHash<int, QByteArray> MyListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[PropertyRole] = "propertyNameRole";
    roles[ValueRole] = "nameValueRole";
    return roles;
}

