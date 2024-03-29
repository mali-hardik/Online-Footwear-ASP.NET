﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="Database")]
public partial class stateDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertstate(state instance);
  partial void Updatestate(state instance);
  partial void Deletestate(state instance);
  #endregion
	
	public stateDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public stateDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public stateDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public stateDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public stateDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<state> states
	{
		get
		{
			return this.GetTable<state>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.state")]
public partial class state : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _sid;
	
	private System.Nullable<int> _cid;
	
	private string _sname;
	
	private string _status;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnsidChanging(int value);
    partial void OnsidChanged();
    partial void OncidChanging(System.Nullable<int> value);
    partial void OncidChanged();
    partial void OnsnameChanging(string value);
    partial void OnsnameChanged();
    partial void OnstatusChanging(string value);
    partial void OnstatusChanged();
    #endregion
	
	public state()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_sid", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int sid
	{
		get
		{
			return this._sid;
		}
		set
		{
			if ((this._sid != value))
			{
				this.OnsidChanging(value);
				this.SendPropertyChanging();
				this._sid = value;
				this.SendPropertyChanged("sid");
				this.OnsidChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cid", DbType="Int")]
	public System.Nullable<int> cid
	{
		get
		{
			return this._cid;
		}
		set
		{
			if ((this._cid != value))
			{
				this.OncidChanging(value);
				this.SendPropertyChanging();
				this._cid = value;
				this.SendPropertyChanged("cid");
				this.OncidChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_sname", DbType="NVarChar(50)")]
	public string sname
	{
		get
		{
			return this._sname;
		}
		set
		{
			if ((this._sname != value))
			{
				this.OnsnameChanging(value);
				this.SendPropertyChanging();
				this._sname = value;
				this.SendPropertyChanged("sname");
				this.OnsnameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_status", DbType="NVarChar(50)")]
	public string status
	{
		get
		{
			return this._status;
		}
		set
		{
			if ((this._status != value))
			{
				this.OnstatusChanging(value);
				this.SendPropertyChanging();
				this._status = value;
				this.SendPropertyChanged("status");
				this.OnstatusChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591
