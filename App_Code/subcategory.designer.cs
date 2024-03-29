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
public partial class subcategoryDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertsubcategory(subcategory instance);
  partial void Updatesubcategory(subcategory instance);
  partial void Deletesubcategory(subcategory instance);
  #endregion
	
	public subcategoryDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public subcategoryDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public subcategoryDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public subcategoryDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public subcategoryDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<subcategory> subcategories
	{
		get
		{
			return this.GetTable<subcategory>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.subcategory")]
public partial class subcategory : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _subcatid;
	
	private System.Nullable<int> _catid;
	
	private string _subcatname;
	
	private string _subdec;
	
	private System.Nullable<int> _status;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnsubcatidChanging(int value);
    partial void OnsubcatidChanged();
    partial void OncatidChanging(System.Nullable<int> value);
    partial void OncatidChanged();
    partial void OnsubcatnameChanging(string value);
    partial void OnsubcatnameChanged();
    partial void OnsubdecChanging(string value);
    partial void OnsubdecChanged();
    partial void OnstatusChanging(System.Nullable<int> value);
    partial void OnstatusChanged();
    #endregion
	
	public subcategory()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_subcatid", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int subcatid
	{
		get
		{
			return this._subcatid;
		}
		set
		{
			if ((this._subcatid != value))
			{
				this.OnsubcatidChanging(value);
				this.SendPropertyChanging();
				this._subcatid = value;
				this.SendPropertyChanged("subcatid");
				this.OnsubcatidChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_catid", DbType="Int")]
	public System.Nullable<int> catid
	{
		get
		{
			return this._catid;
		}
		set
		{
			if ((this._catid != value))
			{
				this.OncatidChanging(value);
				this.SendPropertyChanging();
				this._catid = value;
				this.SendPropertyChanged("catid");
				this.OncatidChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_subcatname", DbType="NVarChar(50)")]
	public string subcatname
	{
		get
		{
			return this._subcatname;
		}
		set
		{
			if ((this._subcatname != value))
			{
				this.OnsubcatnameChanging(value);
				this.SendPropertyChanging();
				this._subcatname = value;
				this.SendPropertyChanged("subcatname");
				this.OnsubcatnameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_subdec", DbType="NVarChar(50)")]
	public string subdec
	{
		get
		{
			return this._subdec;
		}
		set
		{
			if ((this._subdec != value))
			{
				this.OnsubdecChanging(value);
				this.SendPropertyChanging();
				this._subdec = value;
				this.SendPropertyChanged("subdec");
				this.OnsubdecChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_status", DbType="Int")]
	public System.Nullable<int> status
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
