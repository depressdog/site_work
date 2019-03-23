import React from 'react'
import Course from './Course'

class Allcourses extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            courses: []
        };
    }
    componentDidMount(){
        fetch('/api/v1/courses.json')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ courses: data }) });
    }
    render(){
        return(<Course courses={this.state.courses}/>)
    }
}
export default Allcourses