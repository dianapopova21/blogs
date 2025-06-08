import React, { useContext, useEffect, useState } from "react";
import { AuthContext } from "../../context/AuthContext";
import Categories from "../../components/Categories/Categories";
import BlogGrid from "../../components/BlogGrid/BlogGrid";
import usePaginatedBlogs from "../../hooks/usePaginatedBlogs";
import Pagination from "../../components/Pagination/Pagination";

const HomePage = () => {
    const { user } = useContext(AuthContext);
    const [blogs, setBlogs] = useState([]);
    const [category, setCategory] = useState("All");

    const {
        currentBlogs,
        currentPage,
        totalPages,
        goToPage,
        setCurrentPage // ⬅️ добавили
    } = usePaginatedBlogs(blogs, 6);

    useEffect(() => {
        const fetchBlogs = async () => {
            try {
                const response = await fetch(`https://blogs-production-99dc.up.railway.app/api/blogs?category=${category}`);
                const data = await response.json();
                setBlogs(data);
                setCurrentPage(1); // ⬅️ сбрасываем страницу на первую при получении новых блогов
            } catch (error) {
                console.error("Error loading blogs:", error);
            }
        };

        fetchBlogs();
    }, [category]);

    useEffect(() => {
        window.scrollTo(0, 0);
    }, [currentPage]);

    return (
        <div>
            <Categories
                activeCategory={category}
                setActiveCategory={setCategory}
                onCategoryChange={(newCategory) => setCategory(newCategory)}
            />

            <BlogGrid blogs={currentBlogs} />

            {totalPages > 1 && (
                <Pagination
                    currentPage={currentPage}
                    totalPages={totalPages}
                    onPageChange={goToPage}
                />
            )}
        </div>
    );
};

export default HomePage;
