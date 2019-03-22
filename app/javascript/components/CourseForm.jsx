import React from 'react';

class CourseForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            c_username: props.course.c_username
        };
        this.handleC_usernameChange = this.handleC_usernameChange .bind(this);
    }
    handleC_usernameChange(e) {
        this.setState({ c_username: e.target.value });
    }
    render(){
        return(
            <div>
                <label htmlFor="c_username">c_username</label>
                <input
                    type="text"
                    name="course[c_username]"
                    value={this.state.c_username}
                    onChange={this.handleC_usernameChange}
                />
                <input type="submit" value="Update Post" />
            </div>
        )
    }
}

export default CourseForm