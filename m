Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3229028F5
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787962252; cv=fail; b=qlY1jm6GugapynK7xAU0BoZwmGGH33aAi+vIjdLPMwgc860jsoHcb5Hsy23BQ6x6Gxm0oajodqU2v3Puw1nMO8a09cv3pZ2KnRE8qU6Hxv3h5jswe/au5RXuoDeczw15obcmusgej57ty4o6W5JyJx23nCiJnZvYFqrZ5pF18YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787962252; c=relaxed/simple;
	bh=F4+LQNK8iz2BHRncJzQ5l/3b6Sgpr3v/vPGTH6ovzS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UoBLioI9QB/ZwIz+d5ozZyWbkGzmpUUtJeb9dSDyEocOoUG/R3HTG8ohE/SOZz/aHwqvr+s6v1s6PrcT8JOzmUPBznO9Z0y70/F7jwF+m8iH99zBy9T5sDp7IrdN22zxvhiP/abETDKn+IPFx3yVSRppS/Wl1zM2bpcUbHiJ+fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sFF67NYY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Aq29UTgg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sFF67NYY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Aq29UTgg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHKAS03075029
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9/BzG4kBnIh95nw0ax
	CBEaxUzuLEt9iQqdfH42d/wrQ=; b=sFF67NYYCSTgYItwfF30K908hZN6EcvvuY
	m82LjSg81M5CGgTJdTAVVeqmPeppxMVwmY7g+BUsw3Gesx9W/vQjmrcOFQV78dA5
	S9cDFFiyzAbkgD0SivzJT+8biyUQW3sBHEMYixVnZ/IiARphHustC2sO1lmXiYls
	n8oCnGgD3jdlCPFK/W3XURuQqDWF3r3DkI5be+VnOcoQX5QzKUWjCv41tTCEdHpv
	ehMdphk5QT1AAoWAsUSlfwcK4Ceu/9mTjErrH8H0x9EskW5eLZhBgymdakaYcoTu
	fpMLmmHyFhDLjI/Z6fptXErFy++gdZDyrKKkvKpnR9aNbw4rV0DQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g74asapn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:10:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67T09uK0013967
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:10:49 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g84bv5xy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:10:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCAtDOBfvbHq1bSInsozgil2W3eOeNKhXk1g0Dy2S5OaeVs4HtNiCaU9DucUpWsjBcpFGk1CTK68Ka6OZOxRgFgdG/RhrpV+XLFjUxa+nj0RLkyowTGIROD9IwKZH4x+EqzEgTRrkQxzDDAHTlLAQ+4xQf0wzuBhyVn7XwyMkrkxt+8Q2aMObsLgHlTxLEfKYe+HgtH652GFbckGBqbmpSPWqUgkQyWzhH2VVI9gGNiTBa6eUOWYb/6ps5QUHUWYz14XNdhRhBi51ing6NmkRGgK181+xVfGCovgbsKPtuvaihoaovUOesDBfxiIXGWPeE7GkkA5VTapTXoFuNN3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/BzG4kBnIh95nw0axCBEaxUzuLEt9iQqdfH42d/wrQ=;
 b=XstS734CfWJ94/CkE0c2VYpPvhGf19/PUz74l1dZeS5AQaXDiNX/a0zCpzAsRhM7EcwTnGn4jL8JVF2Hk8S6ybUd0NkqWLkZLGEH/JSe1MlJDWTSQ4aJwMDROk/jOFCb9BzbFkeiEbxS8tFFUeNuO3hcth6lEZWjf1QzZqI/x1JGF14ygCmfF5Gu8l+MFRBT23QB4ibbgl/MGAJZDe3QqGb1p4W51ZwxK3hCPxc5CPpSMdwd80tWUeMqeKR46nq0zmytVbfoh6KjNGnheohe/B5NK23rqwId8mbyxBNrx13xfJOB4KBvgibZCPOl7XJwXqY/zvMF8Sh5T0V57u06AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/BzG4kBnIh95nw0axCBEaxUzuLEt9iQqdfH42d/wrQ=;
 b=Aq29UTggNCmIW7gR3Yy7djfniUVI9Qc7ZATMrGL943s2vjVm8Y0RpqX3EPoRaEzcx7pvU9qESeNEbmbNODoCetFAaucMcfyYisvVBPBR2DS8w+LOe+u60X/arjp8thgU1YUS0aXZ7gHnCvokE8vIb5X+XYAnmOFGFkUyAzOjS0Y=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 SJ5PPF2D96878B0.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Sat, 29 Aug
 2026 00:10:45 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Sat, 29 Aug 2026
 00:10:45 +0000
Date: Sat, 29 Aug 2026 00:09:48 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] test: Skip tst.aggmod_full2.sh
Message-ID: <apIjTE93io0szLew@kvh-deb-bpf>
References: <20260318214826.6296-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318214826.6296-1-eugene.loh@oracle.com>
X-ClientProxiedBy: PH8P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::24) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|SJ5PPF2D96878B0:EE_
X-MS-Office365-Filtering-Correlation-Id: 27955b02-d749-4324-42fe-08df0561f8cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JmEC577t42mU67+OLeXTi1CM0VZX5KuGCjskDzgPxorfox8knMDL48Vfg40wBKFIAs7yogSADGjcrqG1A4/j1mqiGkha2dFq1D6u2AtUu6KX6yxSMAhoR5KaiCEbcwiIkbiSrQWkswZzh7PItB1vOenxxqEr4+XaaMQsY0UM5bae51USZxu4F6lszf0+NTyI4U4WbjbCLO/5shgGjwy47KtqvApKqCuhMV6vAIvp73WSw/SaYGhXqYvw1tMYLAr872S+dMw2B8ktW026zEQodMeIiL0iuGCv50eLlyVymp0zFtLS3gHerIm2maR81wZap/5BK6sUHPk3ajfu93t4RLA5znWLB5TpA8e0Ln1Tpy5FC5snHUCURugx386O4xYf2qDpqkB7GX/svjsa4l7eYMV++KMSSc8MTwVM1PYddAQslz56uzXC/9Ce3FMOMlf0eIkQQ0bGfWfDUztVAk0LaxXvL2YtkcViWYm7rgZXT9iPDF+d6dXDdPhDOf/hkmSsZNcUBIdAJyK6NkaRz/sWMRfGyNsIoNqAqItJ3h/emFehKQfsZMBx0qaQJ+tVnq1C0E1C5/FedXgc9oXTKsfA8YucHf4EyjGEaAnl/3TTiaXSAnUoKCBJPnmSbMlF3C5mg9bx+hih7TUrqO8hfce81NSJDkn8tNDU1S8fRrmS/Eo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TfIRgpuVG3hTwteRiw1EGcJgKiTZjh7KhUF9QVLoTa2DEqwzmUQ9Jo2ZUkH6?=
 =?us-ascii?Q?CuSePuHeS9JzFpMRuhACj4L1CsCWzdtXixWWD1d4KF4SYva6jpIKhhvcFUId?=
 =?us-ascii?Q?AF9yGcEgib7DNJuMNmE8omfhemkpquZVZkiyRLEyK2GnGxzEZKOj+iGIUleK?=
 =?us-ascii?Q?U37ROnuJV1udBFk1ntAmPuhqEfF8BWonBtZZ4QM82Q0C7qQa+VFltz9jbFkp?=
 =?us-ascii?Q?UJQCOVZwcG3FYPGIzl/xpvhSW7+xUlcScJD6r27PQdIpezPxUYqUC/wN9IWj?=
 =?us-ascii?Q?P5jT4Km8hyo0HlJruQEkm/zY3bF5dlBfKUzUWph9sAOwoPYa0Ql4jhO42+bY?=
 =?us-ascii?Q?AaZOO/V7DU3nQOZ0IqrAMeHPhar0L1ELkiD13xGA5+961YqUkgL1xlUJWDDX?=
 =?us-ascii?Q?XL1Zz5++UoKPrSnSFCHdFxt2534bB7CljnAJpHm4L0ZhOWCFV3PQDPGjZkA8?=
 =?us-ascii?Q?ZA53LH15mB4e07Rz4but8Iyrl69njhmqHl8RINi0cSg0I4376FKPVNKRvMDi?=
 =?us-ascii?Q?u+GkpvfvhNYDEW+0A3eDdTeSZerxTpQtk+ABauZTBjJS7vnDYVLKp+oqyOb6?=
 =?us-ascii?Q?fFiN89sXdM/8Ke6Z1CQWfZzqQplYTBFOTbIhupVB4Bx5jfnylvBVCoMZXuhx?=
 =?us-ascii?Q?IZ1/4xFtsIDNP+czBUjYx7bIWbpV523cRCoZLztsimLAGvjJX+DUflInrfSr?=
 =?us-ascii?Q?r5snwM8kv+v7CH4W3tpcKZaUyn+03XfN6LgA1JIRiRneviaA5ncj8I3y0v9n?=
 =?us-ascii?Q?lqI+49+4yY6J/1TAf2KvJpdcrLq91ANIEVaoR3gOROzdbwWkjSnkhXa0iY8e?=
 =?us-ascii?Q?mWklFG3+vkC+YTaE8SvFVvPLMnyThba9wl5+5U+PO8Fe7D4SAlKfhx/a+pcp?=
 =?us-ascii?Q?2TULifh/Z1YGRQOWd4fqbjPqPtdY4hNWeCSOHXK6LWthtSXpoJk6+AiK5mPk?=
 =?us-ascii?Q?mpTDMq4RVLTxMsFkS3yXemxVzzh3LJ3MVUdgvLtXz+GWjKp5cZbBtm7sosVQ?=
 =?us-ascii?Q?oN/6qPfFy9GQO+JSZ96t5TJs2qyYTggiyZ9ycIT/CLAOLG5ICEH45m/pwW3j?=
 =?us-ascii?Q?Yomjv0HLrrZHf3QTG4iRn8d7DwFqx6IvmRcjDXf/GQ7lpZ70ZWYtZCvXl+mr?=
 =?us-ascii?Q?Ycd2GoSmiHpIb1MaVVwbyVEtkGAtWJNhyS2xupa+VIA2AAI5Soz4eODwluHB?=
 =?us-ascii?Q?S0rZP21tlOXoCWdBz36JEHMVIi5ziTHmtQrG/8RZuMaZdEYaba4UQPatxRQL?=
 =?us-ascii?Q?4f6zDIOfKebGQfrh85ro0AsAAKIF3jE8BF2aGptWI0PXJ/KggFU+wiY7hjFa?=
 =?us-ascii?Q?7TgK/E/lFQOUEk0g/AuM/7KvWkC66T+Z4AUhFwQak8Ot+LZmtpD2tz495lUC?=
 =?us-ascii?Q?50MPx/WeXc+xnUTRtvsVGPkrv3gxbkSW/hVorjTbDFiqHByysrIiYHjQznZl?=
 =?us-ascii?Q?MuoZEfsT1t821FzfiK4LkW73DmziI2YZLBhQ/IKKlrHEu0Ny/YoRo7sJVqqT?=
 =?us-ascii?Q?isFGkuPpMTXKaOct39IT5gGYr7JyB9e3Fz9IAtOcH0GCWMCIaAa3wQmnaVws?=
 =?us-ascii?Q?tlCqJn038iz3btYc4jzlq8zrQMytHpPCWMZ0ubm7aRQMGxPcLSGaee/VVN0P?=
 =?us-ascii?Q?BiuVGY+uXTI1+O5iVHv8Qi83S2DB+Dd59lcqW9lTIId4viq+aYAb3MPBDPWr?=
 =?us-ascii?Q?/e1vSed+CEtgKBaxsrpbYSpR7chh47kBWfVlNPzBc6Zra2Q48nPxCJV7llYb?=
 =?us-ascii?Q?gdD876avPYRVryI+/fePklLiUnIYGrw=3D?=
X-Exchange-RoutingPolicyChecked:
	ntrYOo6vPApAx7O0v0TDSFY+1aNGLVUI8cus0ABHCWbOJauhB/KgAuI24of6bKXL6FTVKcvKlGd4T8zSB3gR5re7XDH+xHkoqOAa/I1KMhGknPgVsfO7RwNq1yZ8zZkzQ6eVuuPYX9xtne2Pmraj/DQiig0vipj6Heo/zE4N4qoFV3V8ImkYzxBGjWRqaSvbHStzmYDyYmvyCpsMb4ZGqfo1Vm40mcTouexiUUTSlYQH8FNVb2Ge6lZW0rFv9DaZML8rU+wZVwjBOoNjB1NlZqEUoivsFm+2M+EeV9KkRBkOhARF+Nw0ECRzg6ukZwpOCB4ein4TW/Bxmjl3BJLGFQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8hcT8b3W/t3mrFby+uFgS7bWgfcAYwAoN7dqPx7Ugq+kyygGIe+mMQA3fudc9IZKDi5f9R+HlGyumyXoynlRw2msu1lmUWE6MstlBneLPwwMC7qmOCL7UEc+UO5cqJcC2P49QXAcWgc+gqe21ytUdFxhRmgogiIMuOhDI5peH8uUPWsS73yTLvRaiT5Mj8CCLZw2ExwTApJXv4N0IwRvdgUXFiwi4ykog78Flze3AmKhe7Xy9AB//SgsigmJQoNEyK4nLD/C1h+0AECFyiLEy3iWT0kPlpBw8Sf8vkN5LJL/UoAeAHmpmHGvQl4YO/4QCjP0xrJY46SBP6IxdXaY/Bf8Uk+aB56/GEAuCPpSgOz1jX0YU5Lc6hY2KKtdCBkN9ri4VkYvg+VJT9z3oNGMuhFeZixeCahDxkcFSB4quK4Jrlj9BIwu6wq5t/3/jN26QavFl7rQE80WARNK0EXSEoryarpNtb+1GIOpsHzvKrxnP1oHR0629oZXVNiM2c81eDQGm/+JhguKvd+rolmjlwL2Dp2wJ2vH6MwXNJ6IjuIure1qSxQf8iWa+M440IdOh6IB3LB+iqs0jKWV0vE+YQzgmKasJ0H8C0SXqRpX8Hc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27955b02-d749-4324-42fe-08df0561f8cc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 00:10:45.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9d8XLVxErqv/drMFPQ8U8/Q/NLQv8LOe14qRoZDduanvnKE56xzJlDDSQRct69oy45MeRbKIcBGpkZ1jDc+Dk9272uOEbijXxnn7FZGi+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2D96878B0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608290000
X-Authority-Analysis: v=2.4 cv=StygLvO0 c=1 sm=1 tr=0 ts=6a92238a cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8
 a=2tm1tG5QO4wlWRtThm4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: a0vzPqrm_nHIboP14zzkpb93dQYitorR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDIxMCBTYWx0ZWRfX/jxSPCkV47MK
 zCCbFTKD4OmaZiKYOaJVH7E64kILOHjl6t5HxASPa7/ZaLj1T0uJTB6BdDauJONOSQ/gKOiAGYa
 utsl65LxLrF2I+zViMtgy1LQ9mu3/N5jQro02GxGexpesRpQEDdJt0fd8xvfRl0KGAMgND+v/Is
 iqvPWj8DXbJS+1YEub83ac9Q7EjOTcJx0jw/4hqp/HNWtg28iOrSWUcdecC08A6E3it6FdwO/A+
 KXNsNfTTC2rxnYZ2lOhBlR5tICLlQRICQH5dHFJ8/mVIo+0wolrf17I0rOMNNk5+jwqHgmA5zYG
 t60/Yr46nWlfBcJCV8GrET19rhG12iOSAsjBaXLHXozk6HELPxfeHaBaG+XzbvXsJ2OCQOVa/wu
 VOPHy4rhOPSEdsdJzGLCcVZrVrLZmVNF8uB/Go359gd7C40+kNzWIjZAfRrRjSgzPl+U8L5k37b
 okSx9fePA+OY4IivHQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDIxMCBTYWx0ZWRfX4SMPLogaIFPm
 q2TSq2iLuonrEzzPGYqYHKKKUztUGsxnU+P4XfZxaY2icswxuK3HDY5Gp0CH47bE4C+XdHXstC/
 WBEmuuLeaOjhls1mUNq0V4R2ROa0mSvm1+u5T1Bu4wDcm1+uTuC4
X-Proofpoint-GUID: a0vzPqrm_nHIboP14zzkpb93dQYitorR

On Wed, Mar 18, 2026 at 05:48:25PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The test was only being run on older x86 systems, where it had been
> failing consistently for a long time.  Since kernels are moving from
> kallmodsyms to modules.builtin.ranges, we do not care much about such
> problems.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/aggs/tst.aggmod_full2.x | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/test/unittest/aggs/tst.aggmod_full2.x b/test/unittest/aggs/tst.aggmod_full2.x
> index 3660504ad..a530a3d2d 100755
> --- a/test/unittest/aggs/tst.aggmod_full2.x
> +++ b/test/unittest/aggs/tst.aggmod_full2.x
> @@ -1,10 +1,25 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2018, 2026, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> +# Let us skip this test altogether:
> +#   * The test was never vetted on arm.
> +#   * The test does not run on newer kernels since they have no kallmodsyms.
> +#   * On older x86 platforms, the test has failed consistently for a long time.
> +# The test had been intended for checking /proc/kallmodsyms,
> +# but we are migrating to a modules.builtin.ranges approach.
> +# When we are absolutely sure we do not care about this test, it can be removed.
> +
> +echo "test is deprecated"
> +exit 2
> +
> +###############################################
> +### The older contents of this file follow. ###
> +###############################################
> +
>  # The test still needs to be vetted on ARM64, including for copyinstr() support.
>  # Once it runs on ARM64, the slower tst.aggmod_full.sh test can be removed.
>  
> -- 
> 2.47.3
> 
