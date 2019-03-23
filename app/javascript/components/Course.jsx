import React from 'react'
import Allcategory from './Allcategory'

const Course = (props) => {
    var courses = props.courses.map((course) => {
        return(
            <div className="item" key={course.id}>
                <div className="content">
                    <a href={"courses/" + course.id}>
                        {course.c_username}
                    </a>
                    <div className="meta">
                        цена: {course.price}
                        <Allcategory cat_id={course.category_id} />
                    </div>

                </div>
            </div>
        )
    })
    return(
        <div className="ui items">
            {courses}
        </div>
    )

}
export default Course