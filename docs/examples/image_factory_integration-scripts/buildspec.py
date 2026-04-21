from hs_cicd_tools.codebuild.lib.github_notify import notify_status
from hs_cicd_tools.codebuild.lib.util import configure_logger
from hs_cicd_tools.aws.ecr.publish import publish
from hs_cicd_tools.aws.ecr.release import release
from hs_cicd_tools.codebuild.docker.build import build
from hs_cicd_tools.codebuild.cleanup import cleanup_ecr
from hs_cicd_tools.codebuild.local_setup.utils import local_registry_setup, create_context

import logging
from os.path import dirname

log = logging.getLogger('buildspec')


def main():
    project_name = '<your-project-name>'    # Add your project name here
    app_build_context = create_context(project_name, './Dockerfile', workdir=dirname(__file__))

    try:
        configure_logger()
        with app_build_context:
            local_registry_setup()
            build()
            publish()
            release()

        notify_status('success', f"CI succeed")
    except:
        notify_status('error', f"CI failed")
        raise Exception('CI failed')
    finally:
        with app_build_context:
            cleanup_ecr()

if __name__ == "__main__":
    main()
