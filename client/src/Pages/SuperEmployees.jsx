import { useEffect, useState } from "react";
import Loading from "../Components/Loading";
import EmployeeTable from "../Components/EmployeeTable";

const fetchSuperEmployees = async () => {
  const res = await fetch("/api/employees/superheroes");
  return await res.json();
};

const deleteEmployee = async (id) => {
  const res = await fetch(`/api/employees/${id}`, { method: "DELETE" });
  return await res.json();
};

const SuperEmployees = () => {
  const [loading, setLoading] = useState(true);
  const [superEmployees, setSuperEmployees] = useState(null);

  const handleDelete = (id) => {
    deleteEmployee(id);

    setSuperEmployees((employees) => {
      return employees.filter((employee) => employee._id !== id);
    });
  };

  useEffect(() => {
    fetchSuperEmployees()
      .then((employees) => {
        setLoading(false);
        setSuperEmployees(employees);
      })
  }, []);

  if (loading) {
    return <Loading />;
  }

  return <EmployeeTable employees={superEmployees} onDelete={handleDelete} />;
};

export default SuperEmployees;