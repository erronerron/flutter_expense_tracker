import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'model.g.dart';

const tableAccount = SqfEntityTable(
    tableName: 'account',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    modelName: null,
    fields: [
      SqfEntityField('first_name', DbType.text, isNotNull: true),
      SqfEntityField('last_name', DbType.text, isNotNull: true),
      SqfEntityField('email', DbType.text, isNotNull: true),
      SqfEntityField('currency', DbType.text, isNotNull: true, defaultValue: 'PHP'),
      SqfEntityField('createdAt', DbType.datetime, isNotNull: true),
      SqfEntityField('updatedAt', DbType.datetime, isNotNull: true),
    ]);

const tableCategory = SqfEntityTable(
    tableName: 'category',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    modelName: null,
    fields: [
      SqfEntityField('name', DbType.text, isNotNull: true),
      SqfEntityField('icon', DbType.text),
      SqfEntityField('createdAt', DbType.datetime, isNotNull: true),
      SqfEntityField('updatedAt', DbType.datetime, isNotNull: true),
    ]);

const tableExpense = SqfEntityTable(
    tableName: 'expense',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    fields: [
      SqfEntityField('description', DbType.text, isNotNull: true),
      SqfEntityField('amount', DbType.real, isNotNull: true, defaultValue: 0),
      SqfEntityField('paid_at', DbType.date, isNotNull: true),
      SqfEntityField('createdAt', DbType.datetime, isNotNull: true),
      SqfEntityField('updatedAt', DbType.datetime, isNotNull: true),
      SqfEntityFieldRelationship(
          parentTable: tableCategory,
          deleteRule: DeleteRule.CASCADE,
          defaultValue: '0'),
    ]);

const tableIncome = SqfEntityTable(
    tableName: 'income',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    fields: [
      SqfEntityField('description', DbType.text, isNotNull: true),
      SqfEntityField('amount', DbType.real, isNotNull: true, defaultValue: 0),
      SqfEntityField('date', DbType.date, isNotNull: true),
      SqfEntityField('createdAt', DbType.datetime, isNotNull: true),
      SqfEntityField('updatedAt', DbType.datetime, isNotNull: true),
    ]);

const tableSpendingLimit = SqfEntityTable(
    tableName: 'spending_limit',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    fields: [
      SqfEntityField('amount', DbType.real, isNotNull: true, defaultValue: 0),
      SqfEntityField('start_date', DbType.date, isNotNull: true),
      SqfEntityField('end_date', DbType.date, isNotNull: true),
      SqfEntityField('createdAt', DbType.datetime, isNotNull: true),
      SqfEntityField('updatedAt', DbType.datetime, isNotNull: true),
    ]);

const tableTransaction = SqfEntityTable(
    tableName: 'transactions',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    fields: [
      SqfEntityField('transaction_id', DbType.integer, isNotNull: true),
      SqfEntityField('transaction_type', DbType.text, isNotNull: true),
      SqfEntityField('createdAt', DbType.datetime, isNotNull: true),
      SqfEntityField('updatedAt', DbType.datetime, isNotNull: true),
    ]);

@SqfEntityBuilder(expenseDBModel)
const expenseDBModel = SqfEntityModel(
    modelName: 'ExpenseDBModel', // optional
    databaseName: 'dbexpense.db',
    databaseTables: [tableAccount, tableCategory, tableExpense, tableIncome, tableSpendingLimit, tableTransaction],
    sequences: [],
    bundledDatabasePath: null);
