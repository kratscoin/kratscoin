// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KRATSCOIN_QT_KRATSCOINADDRESSVALIDATOR_H
#define KRATSCOIN_QT_KRATSCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class KratscoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit KratscoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Kratscoin address widget validator, checks for a valid kratscoin address.
 */
class KratscoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit KratscoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // KRATSCOIN_QT_KRATSCOINADDRESSVALIDATOR_H
