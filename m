Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36758301004
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600415; cv=fail; b=G2JQlrnvVDRd9wf2UyyF/ZN0gylbHe3F9b7z7sL0KiiJuGMjJRQlYUVYBjFMCAkmsauy+o1tdV/CVsL8u4nTuTTk1dRevdhillTjn8Cgmlk0dkZrjFkjH/SWdiGjsS7IHOGAl81KvPkhSaBo/KA93YwbYuj8DEYIDxB84SWBWEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600415; c=relaxed/simple;
	bh=8lUHArpatMYNZNUhVKPuzlY6G2V9T326DJgS/ZOxwW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Skh4MfZjuo549/hRLhOPBiB/L+Qk8bvz03xZGp01c8qbrrE8klkfLN4nM4Nt6/sUd6vmKPJlPX3bfdjV8cA0v4800trDxKagNcP1GtjQnxYT1PfK0MALqDVSg9nN04QgA/7yfmNR/u6JJwJB5IpBbHNcAKEsslU6W6ag1NVkzWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j61eZyFI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ettq38DJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j61eZyFI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ettq38DJ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKWcnS3528727
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=z8ocZ8Epg++Ng5OSKH
	ylTTLr6kCuKux+SwQa18oxq1k=; b=j61eZyFI0cLnAaGnIAbA8D31F07QwadA68
	pxR93M1OEHTvO9DmGpNZEz/Jq//PYWRsOe8AqxCGnDUUsrqoFw/sECNHSUpxXD7m
	qlUIj0mqmoiGDGkdTt9R/wmG7bbYk0IBpyWMdg5zVxmLItot+cOcaqjF/tJcMbGS
	eUk0L7tV/GDgLhdVApdkVtDfPUnkY1Nd9jn7sBoiSws9yTHBfLFmPfZxxwY+NTQx
	S2f7ITnLorTQrI9mE6/Pjskfq/9C7N0fYfyRdlvu+orpnJMNtTtAHQ0gMdkC4NHz
	e6lGCVVU7OBTK1VFWoVYodkw6KjH7T+4J/9R7N5nMYT92fKf4oYw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvf003ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:53:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKEZCY031303
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:53:32 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv6qtx84-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:53:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nG9nseCZMI8oPri300rFRqq8MSurreHWXVY6vhGT1Q1P/jCpvScmPx9IpwrRTsMSYmyxiuW/akjKcUQe6Qkvy4gMOUKTcO6Dss6IlLL+bfNnFCTlk06q9KXEfV9dpjP/SoQO238k+TPw63gDah/3qE1KWWqEKonyJzTQnWKsBs2Cb/fG0PYSag/O38Vb38pXp8GvjZh/j5P4TmaS2ELy2Q98JamVslDnBjNEAKQf+2yw/RUX2GsQP31NzZNyVp7/OPYFwcizRTU/oNxXty1v+BugB/X1ewRneXYQoEE0N/9N4pW6SO6LfEm2RPqqUotm9FK5Cs3L3ac/SaQX7AYPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8ocZ8Epg++Ng5OSKHylTTLr6kCuKux+SwQa18oxq1k=;
 b=zF/e9x1DfpCbshU4SRyp+9DLCPzfVKDh6jcAYROmhft4RTdnBoWMJ7arF8UN1gQmDGsq2dxke6y3wY46T+VptWz++ibE2c7Ib4mDDc3GsMKaNM+6vQJrTzQsqgjZLseIAn2d4Sokv7rcE9aqdNlWtYbMYt8h3TtYKbIxL7Zyu3fTAdBzTYOsI/OJAWimPU9RUt51wpld0If0aSRB84ik+F+05a5ORUb4VWJbtXbr0cKP6I5gYtpQbZ62dbR5iWlb73u8KX4VtOvzqHKMBQwdKtMi139+ipAEMcSP2PquGXjGbyCVPBBcfonSzWM1JDAJIyXIC3vBpQgYr2vgMo//BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8ocZ8Epg++Ng5OSKHylTTLr6kCuKux+SwQa18oxq1k=;
 b=ettq38DJr0DlFr0b3vP0MA9uqVHSvCyqACq4ywe0BZLCM9V7UQsqdwE9cd2cD1MEc3A+whketn0buzJPUwCTK63R5o2GBCGeMrKqNY5WR9Ld7DAIP02ocTO2DTIkZ+b0nkU2+GTKtOB45cNAspBhUDxYd6uMO+uVNjSWj20HQyc=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by IA0PR10MB7276.namprd10.prod.outlook.com (2603:10b6:208:3dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 21:53:29 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 21:53:29 +0000
Date: Fri, 16 Jan 2026 16:53:26 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] Guard against inserting the same provider twice
Message-ID: <aWqzVkgg-kPCKtag@kvh-deb-bpf.us.oracle.com>
References: <20260116203812.21552-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116203812.21552-1-eugene.loh@oracle.com>
X-ClientProxiedBy: PH8PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::27) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|IA0PR10MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b4502b-ab71-4ff4-5cac-08de5549af31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eUCVepneU+/XJxuCZ/b4eO0Y7rKjw7R1gpSeedCECVvNSbadcwJF2GI0VwYS?=
 =?us-ascii?Q?qD9xpU6CeDwrYe+K0UIUJt6dn2GLxp86iJpUYgWmCGtxPFdKiZIsV9GznsFU?=
 =?us-ascii?Q?egughz+6ywK0ZP4cwvFM2VbaiG/FSmxMirBSxRpnMXE3jI9uqp+jsxEvcnEi?=
 =?us-ascii?Q?uwW/Yh63LWxqwxx5E7OlwM6QE6WbLgLthuVnQQK39QVYEvpX/EwxF2ZGJTe7?=
 =?us-ascii?Q?TffX6qdKUE8vaNKcrzNJBX7vKgrpW6VXvH8+z/sJEU3bQj0Io7sj5+emW5pL?=
 =?us-ascii?Q?+khytYd4Phgntglv/7EDIr5yg/PhLQ4edJIJpi09hrlb1tTbPxXIzmdlJrBo?=
 =?us-ascii?Q?ofcyznF21TSaZnNCkVOEfOtuh4a44mXFMYdt8x+pkI5W/RvOe19BeXBGy6kT?=
 =?us-ascii?Q?pj1Z2efz4Kbgt5G3duxYEru4KU3lkKtb/grcWewJQlAgeUmHJZNjVBJBN0SX?=
 =?us-ascii?Q?Iz0ETeWaAioFWvQ5hTDQcW0VDRwNOHGR8GkNuA2MkecUfrmPVachNY1hy9xT?=
 =?us-ascii?Q?fOxUIjgGcbJUtk0wv6OesL5+zQgEZL4vOpRihj7terlB/EDR5UCLRSkPbcVS?=
 =?us-ascii?Q?ws0Y+MIK29zR7koC3BhwXZFuNL3tU1w24HuUsJvY0FRYDukAZocfoqkXCg+C?=
 =?us-ascii?Q?x4LUNeGmY4Pm3wjtffHQN8XyovrLHxhXTqyYC/b/7QdqrfAgTBlrN6cSgNiw?=
 =?us-ascii?Q?JgjeDskiyblAxDYdWXjs4L3fdROEtV/LxVxcPtOHakEGSILzrPyGACBPwRfB?=
 =?us-ascii?Q?IcnSpUdQSBaIaPosbL5rXijddyRbJyYFvGyE77RWLBDbxTfbvL1svW5+/Zdq?=
 =?us-ascii?Q?uJ2tFTXJuKeVEIDn15y/Ke8R6mR/H99wm8bKDLyS8MtvGYPuZTPg56FauTOJ?=
 =?us-ascii?Q?acMM2Rrinvv6mJFM55YrMDBweea2r0UIEp2CgCJXTRUStTOH8kJaLfuMxLfE?=
 =?us-ascii?Q?pibpBOz2E5oRpfk39mzbkbokSxDXjIpC41QD429fH1ruG3JAbN+0Mk4i7y3U?=
 =?us-ascii?Q?+lf8mqcyXOQNwE1XsGxIO3QDXLWNNou9krtnV8sZP3FkbhK5XdNbfbbgzOlP?=
 =?us-ascii?Q?FDdq3NhnoTMV/WutkO1xYxxvsGQYzGf0Cil0uYroSXS6JFg/A2VGaT5N0JgA?=
 =?us-ascii?Q?WCzKY24n1WM4tKl5m09VLhF56s1J3vIX4hNqjApfpvVH6smQQqAVX3D6z6i+?=
 =?us-ascii?Q?kSIH/4GUsSZ+inbs6rmIavoaHNc0Sy+n6LS6stkh7rx7riOusbFUgUrDggYT?=
 =?us-ascii?Q?nnsEERvKWE7NGyhZCvrdXNHblfvgv4Wx/LxvkSn+WCLkeXkHGiLsz3AexNJp?=
 =?us-ascii?Q?6DFkqvbmV53MB/EPn8nmcd+AFbHtLJflib4FHVIR53sE9EjM/pU1hKx4EV2b?=
 =?us-ascii?Q?LPCcyzCCv0axSDQQN2slPdxAH34Fl3Z8zfDv4wHsegGBMaxRMYjza6Z8V4Nd?=
 =?us-ascii?Q?/W90pL7GdavELK5vXNbPIz2kjYp/Kslj5lcDXPTv+scUMVeW06I/al4JrC/u?=
 =?us-ascii?Q?VJrZb+gOtLzb/XTueKH6PuZMky2MvbWQTzjfMBbWeWPoRjFMS4HbiBDdfJO9?=
 =?us-ascii?Q?IOUg8swYU91OcZLrY2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SSp0yUUvV5zOOXhMLScbUmKYtcb/T2qOkN/GHGcNVcqIc1BVzu9mW95kx3Uv?=
 =?us-ascii?Q?FqlkMXWGp2SrCAQhCinm/CXH9ObELVIE/z8PlsIahLoyyp+y9B1ZUnRHdaJt?=
 =?us-ascii?Q?g/DHHzjT8lWmpvIDAUKB8mtskFoiYklzpjb+A+h927EclnZgpJZ+XGeh+ULo?=
 =?us-ascii?Q?Y08pZ85IRUezSVFES8p/9YAZIwECpd4MJZ0YKCZ0u5ESJVVfrDg4027JL1uY?=
 =?us-ascii?Q?SBDIIDnNHpkpSrJTFIoisvNIhJCiFiyW3W3u1Hq0drgl6uxFM2g1wEZqx0p9?=
 =?us-ascii?Q?VvGuVLeCh26K/GM3E29y+z+PJr8YoQElJE+Z41y6BXAUtNIhbTXFyaJtPrcV?=
 =?us-ascii?Q?o7JV8VHR9d0NdRENjdfP5xbwIMCNKLMdvRXKonM6qtsJ1JJuBiRStfg/FD/X?=
 =?us-ascii?Q?ksH9SjTTsslYTjrsX9IuRDmTyBBMXy/UOkIYHGMjiiGvOhAA3BLBdSJp12Wz?=
 =?us-ascii?Q?Q3CtBX5Cz0CT50a1BHgbC00e4E83MkGTMJC8g5oaZknNLnZ3idX96vI6Uzak?=
 =?us-ascii?Q?m43Vk5NVuLOw7KqP5m46c+xBm/21fAdQrnSSyYSU3kxyDw75Se9FoYu9zg3V?=
 =?us-ascii?Q?6U0khNnIQXXnmh6SLcNpUhDE83XwhN8Fh8pGIoUEy7my0iIKdGyGMBK0eaLc?=
 =?us-ascii?Q?uMeFA9CP0vbpOaGGNKlPUN/uvhzdim7BajfiY3k0NkYZeZP1rNogNSROkJ62?=
 =?us-ascii?Q?+WkRlHnQuUG5ZHmfAihwE8YEs0kj5F0CkgImoZgfo6zqIkbcBHVydA5S5K9I?=
 =?us-ascii?Q?9gWZ9qitZo1fy3yHmSAgyk/ZB3znetU+e8nzBkdH14aJLmnvqzS9Gyb2XQv1?=
 =?us-ascii?Q?Rr6+IzEU2yDXXhThD2ebtI+Esct3B8qt2GPCPyqsQyLY6IwrtTcmUYMgW5p+?=
 =?us-ascii?Q?Tm93jyuBOw5L6468DDiml7lcmlVhEQ0ES3Jtb/4ffgoQGuysiOc9g1XVuTRn?=
 =?us-ascii?Q?IKl0Vtk33GEDGqRJHKB5TGjCXV/WIppYTISm3NZGrBpBmXwEZbO706eFCJSo?=
 =?us-ascii?Q?ItFtxboMMZKGlQOHwjlh0oRytNqbgUrPrnmBzhvhR03MWHRWmXQg8nh3iDXH?=
 =?us-ascii?Q?jrLioqcuJUN7+IqhqTgTktKh/FK+KiFRf2EUe8po11gUrxUBuXcSOpr8/ye+?=
 =?us-ascii?Q?KFrBfu4s1xFqlHcuprN37cfZbIdrYnX5EC4MZotV3iKeoK3d1/nE5I2a9XaP?=
 =?us-ascii?Q?SjAFABKIQWJ0HlH8xKVO1iNSO5P+UbTm57MLsGjaYaGr/R8ohFs0ne8OpgXE?=
 =?us-ascii?Q?HoDtjDWwdAP/tX9A/UO24ax6l2StFQK2KQNn4WC2FLO85+y8cRzLeUavhUBG?=
 =?us-ascii?Q?oBF4atBheYLMGNhnYXK8bJ3rkWRpYslj/Abj5qKbJGekESAqY4+eqiPCFULa?=
 =?us-ascii?Q?WDb7eWqyLbm+ERPZehKP0+rS1n1yM/ElgKmUfRpvGnyZc+xbBZwcodw2RJ2o?=
 =?us-ascii?Q?lWRVBE6gfUGQnggh+y9qou0Gk1e+kQ7aqpA78YMBaUSjHW/RIQ9KkQghgX8Q?=
 =?us-ascii?Q?FOZZuTZ3jn9VSb31WBSMXpwjd00p55HfH1Hr8iRUsBs28Vr+M8N8t4v4sbwV?=
 =?us-ascii?Q?I8RBZG9sWWNeA79ExATzDT5NoEimSADFKLMYR/3NuKugPo4cbQ/MzX02lQgd?=
 =?us-ascii?Q?qEEf/wdk9RIX6YMcs1DfqVHBXUs4OSX7KSlGQ93jzev4+sfQkb8RRwB1yLKb?=
 =?us-ascii?Q?XbS7tCzi3sZ4TVJbcTpEEA0vYCCiOoeGN3U3T8SxkQ3doo/yh6GPAhtGNvu1?=
 =?us-ascii?Q?ZgcnQYVvcDRDjtTeq6u0tGk45azbEAg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7RIttc9p8Z+K32h87aUPX1KYnGT1YS1uSw5zb++seejlQ+8NG6WBkx2nzph8tn/pk5if5m7G7YA0wK5S5AJuQqVvMq0GaqGSH8AYESMyeAAg9dm1uO3F1NszjLBmg6C/tGsj46gPTcIRGHtjlL4NgyVXUpe/0JYOZ1ebeo1eopW274AdU7TkBPIHl25GXzp6gB54dWKb4WeR+HPP2RJHpmfUFiEojFP699DuXiih++dtHpG+vL0wRrkXa92f6W2PHmAj/kbFQJl83uLH1SguR1FUkIs6g0Lj+mxUILfzC+Ueey96ktnBBCeCV0c7JmXRkBftrgWsmWmUp7/4TJUU8ZFqFWoNmXU5Kjku+c7kO0xynyzzp8HfZZOx//GEgaKr5tIr95l8I53ivcB0oy2+oTKnWkmW8piLbXjxvDFYS923P9N53l+gz12EGcETGgkSF36yYb9KWw4OrUOkvlpMgjx07TE5XYWXI4JTABOPUDnTsv2z8J8cZn4tY8151Hk+KnVXkBYFbfIsnf8A2kzBM34ZIyU0eOv9xZxDVkjtQTuGgGbJZ3NsBZx0o9//XDF+YcFopZdyCVR+2XlYmX37CWIZUQSCdKQiGsdG54ZPKX0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b4502b-ab71-4ff4-5cac-08de5549af31
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:53:29.4694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kf7g0E4byRNYIQ57usC+34dpSlqRz6uaYv+w1QwpfTXK5UvDNoo9fdyuOYzEU+x9ir/yDeABuhfxm3bYsuGG7LEiyDQ73085px//fUnUrY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7276
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160165
X-Authority-Analysis: v=2.4 cv=AJKKJ3lP c=1 sm=1 tr=0 ts=696ab35d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=OVTcFlQqaWuKfpIeGt4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2NSBTYWx0ZWRfX0tGzlqUrD6U2
 0kjB10x5G4uy2CAn4MvcZm8Vy/XWXCp4Hyu1ISMWWUW1n9MbywnjxFPJTZzi/F+6ilLRGKyujc6
 udLtNMXbt3SBs+YM2OasbDNnwqBUwkvkUL1NYXiI3e723giFPQpFCHV2oFlJu4fc6qn/4XINA60
 Qa+B87NgCEeBn4JwLEo0trBp/iHS9xdSUYuZ3atPRvkv0QVfqhAlFDOlvzbL6Cq4NTi83m8U4Hu
 yzLDiD9OJLhBB54PbLIpDjb8dLE0z369CQJDNoWROsQIBx3F1XIocBOfPE3orOlPe/2eUXXyNVj
 uHnsfWOY0dbvu3sMp1k7jcbneJKLtUlWeWh8C8134QXAAdWak4gh4heh6IbZL8vV7dzK32I13ht
 CKM6615A4eorcqyp9CwIbKhBDp3ugJD0n6xJcfTcklR9SdOcP/jhMAEGIA4PkQ8zXrLinQcES1E
 Ib+JOuN+Hi5MSsE8+fQ==
X-Proofpoint-ORIG-GUID: 0vOANw4qevMO4Ecx44i6a75sPAubGR4w
X-Proofpoint-GUID: 0vOANw4qevMO4Ecx44i6a75sPAubGR4w

On Fri, Jan 16, 2026 at 03:38:12PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Add a safety net to dt_provider_create(), to check if a specified
> provider has already been inserted.
> 
> This also requires a corresponding change in dt_provider_lookup(), so
> that it will work even if no providers have yet been inserted.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_provider.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 848fdc132..e073e1f2d 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -110,6 +110,9 @@ dt_provider_lookup(dtrace_hdl_t *dtp, const char *name)
>  {
>  	dt_provider_t tmpl;
>  
> +	if (dtp->dt_provs == NULL)
> +		return NULL;
> +
>  	if ((strlen(name) + 1) > sizeof(tmpl.desc.dtvd_name))
>  		return NULL;
>  
> @@ -124,6 +127,10 @@ dt_provider_create(dtrace_hdl_t *dtp, const char *name,
>  {
>  	dt_provider_t *pvp;
>  
> +	pvp = dt_provider_lookup(dtp, name);
> +	if (pvp)
> +		return pvp;
> +
>  	if ((pvp = dt_zalloc(dtp, sizeof(dt_provider_t))) == NULL)
>  		goto nomem;
>  
> -- 
> 2.47.3
> 
