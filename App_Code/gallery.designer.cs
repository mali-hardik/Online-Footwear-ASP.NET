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
public partial class gallaryDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertgallery(gallery instance);
  partial void Updategallery(gallery instance);
  partial void Deletegallery(gallery instance);
  #endregion
	
	public gallaryDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public gallaryDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public gallaryDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public gallaryDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public gallaryDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<gallery> galleries
	{
		get
		{
			return this.GetTable<gallery>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.gallery")]
public partial class gallery : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _gid;
	
	private System.Nullable<int> _proid;
	
	private string _gallfimg;
	
	private string _gallbimg;
	
	private string _gallrimg;
	
	private string _galllimg;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OngidChanging(int value);
    partial void OngidChanged();
    partial void OnproidChanging(System.Nullable<int> value);
    partial void OnproidChanged();
    partial void OngallfimgChanging(string value);
    partial void OngallfimgChanged();
    partial void OngallbimgChanging(string value);
    partial void OngallbimgChanged();
    partial void OngallrimgChanging(string value);
    partial void OngallrimgChanged();
    partial void OngalllimgChanging(string value);
    partial void OngalllimgChanged();
    #endregion
	
	public gallery()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_gid", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int gid
	{
		get
		{
			return this._gid;
		}
		set
		{
			if ((this._gid != value))
			{
				this.OngidChanging(value);
				this.SendPropertyChanging();
				this._gid = value;
				this.SendPropertyChanged("gid");
				this.OngidChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_proid", DbType="Int")]
	public System.Nullable<int> proid
	{
		get
		{
			return this._proid;
		}
		set
		{
			if ((this._proid != value))
			{
				this.OnproidChanging(value);
				this.SendPropertyChanging();
				this._proid = value;
				this.SendPropertyChanged("proid");
				this.OnproidChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_gallfimg", DbType="NVarChar(50)")]
	public string gallfimg
	{
		get
		{
			return this._gallfimg;
		}
		set
		{
			if ((this._gallfimg != value))
			{
				this.OngallfimgChanging(value);
				this.SendPropertyChanging();
				this._gallfimg = value;
				this.SendPropertyChanged("gallfimg");
				this.OngallfimgChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_gallbimg", DbType="NVarChar(50)")]
	public string gallbimg
	{
		get
		{
			return this._gallbimg;
		}
		set
		{
			if ((this._gallbimg != value))
			{
				this.OngallbimgChanging(value);
				this.SendPropertyChanging();
				this._gallbimg = value;
				this.SendPropertyChanged("gallbimg");
				this.OngallbimgChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_gallrimg", DbType="NVarChar(50)")]
	public string gallrimg
	{
		get
		{
			return this._gallrimg;
		}
		set
		{
			if ((this._gallrimg != value))
			{
				this.OngallrimgChanging(value);
				this.SendPropertyChanging();
				this._gallrimg = value;
				this.SendPropertyChanged("gallrimg");
				this.OngallrimgChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_galllimg", DbType="NVarChar(50)")]
	public string galllimg
	{
		get
		{
			return this._galllimg;
		}
		set
		{
			if ((this._galllimg != value))
			{
				this.OngalllimgChanging(value);
				this.SendPropertyChanging();
				this._galllimg = value;
				this.SendPropertyChanged("galllimg");
				this.OngalllimgChanged();
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
