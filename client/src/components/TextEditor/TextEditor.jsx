import React, { useRef } from "react";
import "./TextEditor.scss";
import {
    CiTextAlignCenter,
    CiTextAlignLeft,
    CiTextAlignRight,
} from "react-icons/ci";

const TextEditor = ({ setContent }) => {
    const editorRef = useRef(null);

    const toggleStyle = (command, e) => {
        e.preventDefault();
        document.execCommand(command, false, null);
        updateContent();
    };

    const toggleAlignment = (alignmentType, e) => {
        e.preventDefault();
        document.execCommand("justify" + alignmentType);
        updateContent();
    };

    const toggleHeading = (headingSize, e) => {
        e.preventDefault();
        const selection = window.getSelection();
        if (!selection.rangeCount) return;

        const range = selection.getRangeAt(0);
        const parentNode = range.commonAncestorContainer.parentElement;

        if (parentNode.tagName.toLowerCase() === "span" && parentNode.style.fontSize === headingSize) {
            parentNode.replaceWith(...parentNode.childNodes);
        } else {
            const span = document.createElement("span");
            span.style.fontSize = headingSize;
            span.style.fontWeight = "bold";
            span.appendChild(range.extractContents());
            range.insertNode(span);
        }
        updateContent();
    };

    const updateContent = () => {
        setContent(editorRef.current.innerHTML);
    };

    return (
        <div className="text-editor-container">
            <div className="toolbar">
                <button className="editBtn" onClick={(e) => toggleHeading("28px", e)}>H1</button>
                <button className="editBtn" onClick={(e) => toggleHeading("24px", e)}>H2</button>
                <button className="editBtn" onClick={(e) => toggleHeading("20px", e)}>H3</button>
                <button className="editBtn" onClick={(e) => toggleStyle("bold", e)}>B</button>
                <button className="editBtn" onClick={(e) => toggleStyle("italic", e)}>I</button>
                <button className="editBtn" onClick={(e) => toggleStyle("underline", e)}>U</button>
                <button className="editBtn" onClick={(e) => toggleAlignment("Left", e)}>
                    <CiTextAlignLeft />
                </button>
                <button className="editBtn" onClick={(e) => toggleAlignment("Center", e)}>
                    <CiTextAlignCenter />
                </button>
                <button className="editBtn" onClick={(e) => toggleAlignment("Right", e)}>
                    <CiTextAlignRight />
                </button>
            </div>
            <div
                ref={editorRef}
                className="editable-div"
                contentEditable="true"
                suppressContentEditableWarning={true}
                onInput={updateContent}
            />

        </div>
    );
};

export default TextEditor;
