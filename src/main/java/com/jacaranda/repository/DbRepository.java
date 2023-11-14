package com.jacaranda.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.jacaranda.model.Company;
import com.jacaranda.utility.BdUtil;

public class DbRepository {

	public static <E> void addObject(E c) {

		Transaction transaccion = null;
		Session session = (Session) BdUtil.getSessionFactory().openSession();
		transaccion = (Transaction) session.beginTransaction();

		try {
			session.persist(c);
			transaccion.commit();
		} catch (IllegalStateException e) {
			e.printStackTrace();
			transaccion.rollback();
		}
		session.close();
	}
	
	public static <E> void delObject(E c) {

		Transaction transaccion = null;
		Session session = (Session) BdUtil.getSessionFactory().openSession();
		transaccion = (Transaction) session.beginTransaction();

		try {
			session.remove(c);
			transaccion.commit();
		} catch (IllegalStateException e) {
			e.printStackTrace();
			transaccion.rollback();
		}
		session.close();
	}
	
	public static Company searchCompany(String name) {
		Company result = null;
		Session session = BdUtil.getSessionFactory().openSession();

		SelectionQuery<Company> c = session.createSelectionQuery("From Company where name = :name", Company.class);;
		c.setParameter("name", name);
		List<Company> company = c.getResultList();

		if (company.size() != 0) {
			result = company.get(0);
		}

		return result;
	}
	
	public static <E>void modifyObject(E obj) {

		Transaction transaction = null;
		Session session = (Session) BdUtil.getSessionFactory().openSession();
		transaction = (Transaction) session.beginTransaction();

		try {
			session.merge(obj);
			transaction.commit();
		} catch (IllegalStateException e) {
			e.printStackTrace();
			transaction.rollback();
		}
		session.close();

	}
	
	public static <E> E find(Class<E> c, Object o) throws Exception {
		Transaction transaction = null;
		Session session;
		E result=null;
		try {
			session = BdUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			throw new Exception ("Error en la base de datos");
		}
		
		try {
			result = session.find(c, o);
		} catch (Exception e) {
			throw new Exception ("Error al obtener la entidad");
		}
		return result;
	}
	
	public static <E> E find(Class<E> c, int id) throws Exception {
		Transaction transaction = null;
		Session session;
		E result=null;
		try {
			session = BdUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			throw new Exception ("Error en la base de datos");
		}
		
		try {
			result = session.find(c, id);
		} catch (Exception e) {
			throw new Exception ("Error al obtener la entidad");
		}
		return result;
	}
	
	public static <E> E find(Class<E> c, String id) throws Exception {
		Transaction transaction = null;
		Session session;
		E result=null;
		try {
			session = BdUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			throw new Exception ("Error en la base de datos");
		}
		
		try {
			transaction = session.beginTransaction();
			result = session.find(c, id);
		} catch (Exception e) {
			throw new Exception ("Error al obtener la entidad");
		}
		return result;
	}
	
	public static <E> List<E> findAll(Class<E> c) throws Exception {
		Session session = null;
		List<E> result=null;
		try {
			session = BdUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			e.printStackTrace();
			//throw new Exception ("Error en la base de datos");
		}
		
		try {
			result = (List<E>) session.createSelectionQuery("From " + c.getName()).getResultList();
		} catch (Exception e) {
			throw new Exception ("Error al obtener la entidad");
		}
		return result;
	}
	
	
	
}
