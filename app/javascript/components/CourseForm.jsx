import React from 'react';

class CourseForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            category_id: props.categories.id
        };
        this.handleidChange = this.handleidChange.bind(this);
    }
    handleidChange(e){
        this.setState({ category_id: e.target.value });
    }
    render(){

        return(
            <div className="ui grid">
                <select name="course[category_id]" id="course_category_id" onChange={this.handleidChange}>
                    <option value="1">иностранные языки</option>
                    <option value="2">разработка</option>
                    <option value="3">верстка</option>
                    <option value="5">другое</option>
                </select>
            </div>
        )
    }
}

export default CourseForm