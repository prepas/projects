#include "MyListModel.h"

#include "MyListModel.h"
#include <cassert>

MyListModel::MyListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    for (int j = 0; j < 30; ++j)
    {
        if (j % 3 == 0)
        {
            Pair_pr pr;
            pr.first = QString("Verrry looooong:");
            pr.second = QString("stringgggg");
            m_data.push_back(pr);
        }
        else
        {
            Pair_pr pr;
            pr.first = QString("MyData:");
            pr.second = QString("stringgggg");
            m_data.push_back(pr);
        }
    }
}

QVariant MyListModel::data(const QModelIndex& index, int role) const
{
    if ( !index.isValid() || index.row() < 0 || index.row() >= m_data.size() )
    {
        return QVariant();
    }
    const Pair_pr& modelEntry = m_data[index.row()];
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

int MyListModel::rowCount(const QModelIndex& parent) const
{
    return m_data.size();
}

QHash<int, QByteArray> MyListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[PropertyRole] = "propertyNameRole";
    roles[ValueRole] = "nameValueRole";
    return roles;
}

