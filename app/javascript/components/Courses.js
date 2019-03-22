import React from "react"
import PropTypes from "prop-types"

class Courses extends React.Component {
  constructor(props){
    super(props);
    this.state = {courses: []}
  };

  oneCourse(course, i){
    return (<li key={i}>${course.c_username}</li>)
  }

  allCourses(courses){
    return (
        <ul>
          {
            courses.map((course, i) => oneCourse(course, i))
          }
        </ul>
    )
  }
  render () {
    return (
      <React.Fragment>
        {this.allCourses(this.courses)}
      </React.Fragment>
    );
  }
}

Courses.propTypes = {
  c_username: PropTypes.string
};
export default Courses
