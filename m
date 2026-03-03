Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81936391826
	for <dtrace@lists.linux.dev>; Tue,  3 Mar 2026 18:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772563191; cv=fail; b=m49TZgou5QZRjp1A4xFi5cObb196U9mM2Du1YWW+/8honJyDVZ13Y4qiyEHI/yDBtAXVBs7d/9z0kWOmPMcCyjPNH2q9CmhDrKEggejOrrgSg8hUg4834GZIAkc11Jbby6i8LKd4QFF6Nfqj3VdS5PO9cdpCIvr9mY/1LrN8Hg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772563191; c=relaxed/simple;
	bh=F5sLCDQwxJzSDZsJ8gpaWwx/4MUwklLeSlPnmocbsWs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=i2FqFxf2uT02La/USjHj5hrINv1OqPvl1rkhMYqjzpcGah8hAH6FFpq8MQIfpmmyxEcLfd/GKIL5quAVlLrJfMMyE+CTni7pre5mofVd/pjbPsduSUYsP12SXXPXKICRA4txe885b+WXxZFeg/72IaNHoOxg9FTxcpFGbWAItNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ADZXNZtN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=poDbcq/p; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ADZXNZtN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="poDbcq/p"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623I8Xbh2202456
	for <dtrace@lists.linux.dev>; Tue, 3 Mar 2026 18:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=dN6NgpB6Qg8TuK1anTVn7eGiuSsiRxDWcZhk1mxs4oA=; b=
	ADZXNZtNSlLRkkczynaKCqaxrELJA4nmTzqeSg/Xww7CBqz+g+lN9l/4CXc7gwl7
	qJtXOCWxtkcFoMxfkha0Fw3G8NtpA8VaBZ1VIYPLMDGHcEwvgl3hM+GyBzb9MTwc
	Rm6/YsqwH0k4RwJPgJuxfbq5AynZXl4uO962jHpGM9MM4DyCAhYyYkP0FlqBlQAw
	ACk+2NumQ80y9fBtEXmQ6SZEgbuenstXiVX/diLDQG3T4L5OPyDnRcq9jfkz5Mln
	jfk7iEOdEeNHeTbtWCCcQy9xtPF2ynJN8uRQUBqIm8xRe+rR+kwJhFBP7dx94vHx
	Xr1VGz6YG8j+vc5HVCliEw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cp4nf01tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Mar 2026 18:39:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 623Gt3uK029685
	for <dtrace@lists.linux.dev>; Tue, 3 Mar 2026 18:39:47 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptaq5em-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Mar 2026 18:39:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1GXzNPoDoiLUA60Mq+xsOme0z3KfU9EaYVCZ+SOp4FhF5ny2qgUIAXwspxL4w61cfihRqDaymewRXvcLXjWMWzZCdmKIPaiooAyVbOv3NtHH1lfjZzfiETd/cSTjWruRzPL9LLOZ79vu7LsJQbd6j6E4MImJ1e6HP/U62IAEAbc/MHOPcVp4/VsHCSMWAEUmf3Ey1G2/dbQGu2QLq4X9ZQfPqcTir5T1yEavbjUNWeVtCIlEqmZNQDjmTN+iJtHdU9wnNKACWCiL1lXCZ/56WIHqTvUwt9s8N7PaKb7dgGCED63CxY9xrJam1uU1L0YrwIddAMy3pn1+69dXdDCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dN6NgpB6Qg8TuK1anTVn7eGiuSsiRxDWcZhk1mxs4oA=;
 b=fkQ/cMQoYEoblOqd4kYHkC2MilBzH2F+P4t8d0CrNGYQmW50HXSInkIXtQmogwL4qDk7JY+ZLKd8UbIXPYMFeMzvAOYLM7ue3hlWHK8xCQR4KpldAbDt9vhGT60D1QaskQfJt/sgFt8PsQfJ5dkdmruHCm6+q5MK4v9zIrmX3woQEJUQb3HnpfmqYAONfdMdpHNqOjIlbthGVB8NZJ0y9A/kTRe97kkI1AdENXdj0kv/gA+g3CcKBf5VF3xJ72ycSK7pqyrKFOFVjw4fjfVjZQI8X2cQkLh2+XLbRB8KewMntbgYDUI3saKBljA4on/+D7ab3J1E1IAP7q31zYKRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dN6NgpB6Qg8TuK1anTVn7eGiuSsiRxDWcZhk1mxs4oA=;
 b=poDbcq/pSo02SHNqY4yCRLVzVE5w7ah/yHc1Tdben6mSjNcG8sbMbg0oRiD5680R+6flo3bX0LPpmDTVtqUaBGJqMTP6GqSRaGcx83Wr4zR5atr3mMeKPWPKPPtvifZ6xGTQ1CtVikTmbBWXTBEH81bK1n/DOCwneWso/KDykKA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB6737.namprd10.prod.outlook.com (2603:10b6:610:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 18:39:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 18:39:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Update github repo name from dtrace-utils to dtrace
Date: Tue,  3 Mar 2026 13:39:36 -0500
Message-Id: <20260303183936.18507-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: 325f2f47-eb3a-4991-2df7-08de79543a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	x5ZxqHFxiOCSTWDiTpkSSMz1ZE7y0gDyPFKy1D8xRan4VmIYptFyqGqCCLI/uIYauaj06jHb+Qsg5+xbpOVyCQOTXjKkAbpc9UUyCYHA4+T3d+cFouRCmMEuBxyWdjm+dINyNqpL5RitO640beaOsRJc6RBpZtF2LRjz0z7+eApRp/WcBWI/4Mzj27A0p4zwu4BnA/VFjln3aDIOfLZ6/1EqK+xiYnom+qttsRr6qcgyEWgVAeljcSZ1EA5K8v6QSxtHB2f4CzoBV2PTXiYD1AdJWqoHisJE7dhNFPHn6Slzwf1Kr+hYOE+/uxn3FKx3NZq/Pt5gz3nUxY2ugju4IXd9TtgkyZedpNVl3DVzTmntsLzCNA6hA3f5n3vpK3zX4b3oOwee2RhQsolAWeOFYR37JVWk6weQ7L9nJGm+N5wkBC3rSuDy/TNIA2uyjKmP7AFBXIsl1Jr4dlNPn637ilZ6ZLTuCmMhAtCKo0YZItPcvpUYljGa6ytfUmmTghFQXekalpHNbQSx6KPI4oG2IC+3PkXkk0JIGbGyWc129qZECsSG/DiNCbjTJx23ESUxxm/JkLGw/gb5bmJhggBwveqBm3T95z33ketjoJynA3lbOcbu/DuLNYJcsNg8XgTVfCoUS5qKEdG0IOG3cJhMRyHqdz502nAmd4/fvFpQSNUt9HFESiinYagRV6hRYLar
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dl7wZ3AAydKvaVCyYdDz1K2pdu61m5bYjo+WFzbgVWYd8HbZVtcMxAalhjMQ?=
 =?us-ascii?Q?Jvu6j70H6MTWM6SJBxKXEbKetntYcvPTsL+YXVxQonVTbldYpO7U1c5i2WId?=
 =?us-ascii?Q?FKzoAEkfur/iSx4JrQlq/TCRyCYlmyIQvRMMV94JnfoAXtwNcghrBHrvQLxG?=
 =?us-ascii?Q?4Dy1jaRSQUO7TEG4KC62kn/zyVDh6k7XyuFL8ukyBUsilw7mtglNHFHpmU/l?=
 =?us-ascii?Q?vniUpZXek3zi+eLXt6uae10HsdWtfhGT7QpEKDrK4iQQXKDsnwDqLbIfqOOw?=
 =?us-ascii?Q?wu+LrTyvZeJq5LMrmKbv8XpYhifFDauIR/ZOBmIFMNgmwJ1Xf6keO9sJcgZS?=
 =?us-ascii?Q?zGapjfj7BpL5jNUeo8pmAFGW+qm5WbsK3WOoZs3XiS3HZAKB4u0E76zHCW8M?=
 =?us-ascii?Q?dQLqUQt8E8fiyCChNTZbBYYeHrziuJrHLNTrajATS/PwOfjpyOMC1NPvSKQk?=
 =?us-ascii?Q?icAxp6L9B+rqu3XoArm0fQvBYcAoP6gbX9rlhyKWOPWPvsz+37Nfmc9tlu/v?=
 =?us-ascii?Q?l8+tSqt4VuxV7hKlRNXEUc0Ol5J2zp3lIeGfXJuxyb1rSU4ilDiexEYtNxmI?=
 =?us-ascii?Q?osjdYUSueyRa8+HkrFKksCzh5AW+Uk7VK9BKfVBq+6Aab3XF3jim7GVYg5++?=
 =?us-ascii?Q?O6HNmbHfA90lTQx5WXnFeNE1usXDAYb5KjF22rQVprOagquZVG7DXNbcCx95?=
 =?us-ascii?Q?N1edWCEcWEsVqm/M9ugEM2tRN4QR3CnwO6cb8RkmzKmPd4mZhe8jj/JBn6r+?=
 =?us-ascii?Q?ZIMq2pC0w0EiL6u5FGvxrtUie23HcNn/U3psfbEMuJIsSv5Ir/JFTpGdgRQy?=
 =?us-ascii?Q?JuRtDOx0QTU6UiZHWdWegeQpJ8fxcqK0bBvTaFCaLJqqULcZYo7f/HYc/e8j?=
 =?us-ascii?Q?SJ+IweSjjaogo5fIPzK+C0oGSbaTJjmF3YlDsauV3Ay8NvQuksELt7kWumtw?=
 =?us-ascii?Q?/jYb+gTNvZ5LtZxTgq5wbaDLSDfCeA9mg35DtjhDLTS6EpF+lo4LVfnKrecx?=
 =?us-ascii?Q?OXIE236nEJYn8fy6G1j2xYAjXjDtpqmCRY55hhZgMCasZbZvroYlM5r+CU9w?=
 =?us-ascii?Q?fvc4uWv+j0Tmqh1R9BOxFNOlre7lH4M66zVu2rNXVj7mXfHJZxGYUZsYWfwF?=
 =?us-ascii?Q?aiAuZumGejwuZrEO0COqwu9A7ZVUGLA8WMtTIW5+NNA4AXeVjwpTF0DzMtBl?=
 =?us-ascii?Q?hbOimsF0A6Ye0Mkr1zKj86hBq0NvpXomZN8mBnNqOW8SuBlQwBLNBVC+X1oI?=
 =?us-ascii?Q?ydpNO71qVcRIuDHS3GrvisLpGH2DhWfRWR0gFUCLtObdCB7zbLdCDuD3ogLd?=
 =?us-ascii?Q?S/RNMri6Qfrx4+rTGrrHCHidTiKumy6wQ5EE2Ps2lu9r7SafaRTcbF42pywF?=
 =?us-ascii?Q?RbUrPIY6Z9+vl7338SRmiX3ePzb/lushzGzD2lvGfSmG7bGnjUoBSKL8KIli?=
 =?us-ascii?Q?zlvZ3WVhv0nUlCnEG/WjdQ6ZCu4LdSKC/S8llTFro8z1U8jNk6DCOyOO9bj6?=
 =?us-ascii?Q?n+CAZW2mda0Jt3IzHChVKpGhs5JmmTBZH5r2+4BVsrKGwoTHVM/bpqMMYZo6?=
 =?us-ascii?Q?f7hqLys5vLHj7HXjuK77XnlWT5o1Qixu9Ho5/muBLr/Th2HE4lggjsV/5LnR?=
 =?us-ascii?Q?/OtoBxnGsCxkC8SXVlGT98LMLEzIm4pLkYWF7W267dY3VE5UrfSnuXzWt68F?=
 =?us-ascii?Q?nF32eXxlmWTpLYbaYGIQKAtqBg6mymyc3xR/wkmeE6heVwA+NqLpX3IRzJ9d?=
 =?us-ascii?Q?K037WQh4Tg=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	HcWqCv/bKY02sGO/66c9/4d9T+NB6t/Y+LUL/4HZdyjYN69FjbOWw8Let2xonXOi67kb1i6Uc9xz04GJ5rdqSjJH139FeK5hh+Le0ZU19RegKDlEQ5VtR7Ei0tPAFBdXuKMaCSqnAUSwiZ4RAOwVH3qVPP03UhJDO8dw41Pfv58Xn2iOuKIAGuLxEuQpzehoxLGBhpfun85nHaijy9zIYDmKGlXozaMO5d+5ey2eZtnYbNSVXR9KHu/r65xZjq4PpC+f7kQXLlYaX1L/MOkk/WRtVsWDrHIzFA4f8oXv3jevIilRu9IXX8rzXA/DKmqAqRQnQWproHhEYFVihaGZFw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YEh80unrpT/kBCFc4D3itH+NZL6mlEJM4xzu7Woy9IfFqo02Yi6ZqFjAv2bWFqcwxkOTIOv8NKWLYz7giabHxRPh18h8p0q0uVDy66tLZ+vAJ54igMrFyFETHFECoJX0KvZxtw9dkL8tAvIEyWlB9UBJK80/N4c7OhLAa588g/btdDxDjIQ5Y7BRVARLi7lnU9g2pebFqXJGZAR2LwRUab11mPrgpI6/JAKwQxPdFC05trV9JKRtEwfFcpwVYjIccmsSFgBXIXkigTdI2fcMiJgzGCZL2zPMnte+tfKzYd2dO850dTgR0SlsgakuFbAadwFQYmYvecXZ6lkt4w/HD7PiFzJOxDFN5/k/yIRVuvsr/GpvbaKgKw47Glu/SYNpeEz4A57zaNQ+n/Pe1HKj1YM2WePHKGfAdWE7VKJnQ/CpumJCewlK2lICglv16Uct4q0W7ydopk16f+svPhndM9lmMxb/0EGLukxAC/+PKe7oTEVRaWg/bC0AF6F/RDY2Al5uCzdH4I56okNqKkrUX37TEpRHBAw2V50E+IgpC+LTHzMsUD9TrBo7fpo/OzOFmVuHdRGLsgMv3ZE/8C5tPECDt86NSZ6qIN6m5GA8goY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 325f2f47-eb3a-4991-2df7-08de79543a48
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:39:39.7219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISim6/6rO47Ootawb65W9zGJTu2594BJLay8bIjuGEDNpqwgiUifiIo157cNqNx01LBwrqL1CFBRItdaH6/ahQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6737
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603030150
X-Authority-Analysis: v=2.4 cv=Mc1hep/f c=1 sm=1 tr=0 ts=69a72af4 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=NEAV23lmAAAA:8 a=cMSsWa0dAAAA:20 a=yPCof4ZbAAAA:8
 a=-bMhQ6iiAAAA:8 a=49uFkzNgJBMQBw02sK4A:9 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19
 a=aViEl8YYgB_fEZN5ws7z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: BD7lkAffuzUgdWcYlqDtqJZJi-OoOvDH
X-Proofpoint-ORIG-GUID: BD7lkAffuzUgdWcYlqDtqJZJi-OoOvDH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1MSBTYWx0ZWRfXy+PzkloCjjsL
 hdwMQpI+OKWPlWhSoX8KEXxnIS/p2xeCXuZNEycwDSvF0smJwOCMCXe5tXKGSvfmddbPCbNqVEb
 AbCAvmb9l6rNK+yHwRpzyqYAQHZnSC2t+p9VBPnqo57O0KpSwj397IByZeYeX7tpqBnYjn11/bR
 VLp0jEX1EVErU4KwD9OjpWkhbjswrCuMSuUIYcdB+kWX/gkztZN2e2D1UWb2mv3SzIyjTI4cun5
 t7c8st0a59lCJZVJekUv0lEgChh/+RfOcCHLqGFiy0i1W/YSRrw3Z79BGEaTuQCGvkPLewFqZSi
 iOrlG+3jmn/lRZTHEo42sEdgTj3wa6Q7pDNrJ9QcdJCrLvmdnVO36hRHNXVc6AGkIv4Kmd0Eisr
 UaYfPH5rUYk9vvhj5OqbmFQCzpxCg3TliqC59cKbemd/JouFFQsXW/F6gjxZEgfi8MBYcxbafyk
 fl2wEz0TIy2491IWMyA==

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 README.md                                 | 4 ++--
 doc/tutorial/1.IntroducingDTrace.md       | 2 +-
 doc/tutorial/4.GoingFurtherWithDTrace.md  | 2 +-
 doc/userguide/explanation/dtrace-about.md | 3 ++-
 llm/README.md                             | 4 ++--
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/README.md b/README.md
index 95e434340..e7b4b7a1e 100644
--- a/README.md
+++ b/README.md
@@ -7,7 +7,7 @@ visibility for our work and to make it even easier for people to access the
 source.  We also use this repository to work with developers in the Linux
 community.
 
-The main development branch is [devel](https://github.com/oracle/dtrace-utils/tree/devel).
+The main development branch is [devel](https://github.com/oracle/dtrace/tree/devel).
 
 We provide prebuilt x86_64 and aarch64 DTrace userspace packages for
 Oracle Linux 10 (UEK8 kernel),
@@ -162,7 +162,7 @@ The most recent logs are also available by via the `test/log/current/` symbolic
 
 The testsuite itself has more dependencies that need to be installed.
 The full list is available in the
-[dtrace.spec](https://github.com/oracle/dtrace-utils/blob/devel/dtrace.spec)
+[dtrace.spec](https://github.com/oracle/dtrace/blob/devel/dtrace.spec)
 file.
 
 ## 4. How to run DTrace
diff --git a/doc/tutorial/1.IntroducingDTrace.md b/doc/tutorial/1.IntroducingDTrace.md
index c91cf88e4..3236edf82 100644
--- a/doc/tutorial/1.IntroducingDTrace.md
+++ b/doc/tutorial/1.IntroducingDTrace.md
@@ -201,7 +201,7 @@ for more information about providers and their probes.
 ### Preparing to Install and Configure DTrace
 
 DTrace is available for Linux from
-[github](https://github.com/oracle/dtrace-utils/tree/stable).
+[github](https://github.com/oracle/dtrace/tree/stable).
 Or, there are
 [DTrace packages built for Oracle Linux](https://www.oracle.com/linux/downloads/linux-dtrace.html).
 
diff --git a/doc/tutorial/4.GoingFurtherWithDTrace.md b/doc/tutorial/4.GoingFurtherWithDTrace.md
index e267db907..a4e62bdbf 100644
--- a/doc/tutorial/4.GoingFurtherWithDTrace.md
+++ b/doc/tutorial/4.GoingFurtherWithDTrace.md
@@ -7,7 +7,7 @@ For more information about using DTrace on Linux, see the
 There are [DTrace trainings videos](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace).
 
 The latest DTrace development work and source code for Linux is
-available at <https://github.com/oracle/dtrace-utils/>.
+available at <https://github.com/oracle/dtrace/>.
 
 Or, there are [DTrace packages built for Oracle Linux](https://www.oracle.com/linux/downloads/linux-dtrace.html).
 There are
diff --git a/doc/userguide/explanation/dtrace-about.md b/doc/userguide/explanation/dtrace-about.md
index b832799e4..0d8caa313 100644
--- a/doc/userguide/explanation/dtrace-about.md
+++ b/doc/userguide/explanation/dtrace-about.md
@@ -22,7 +22,8 @@ This implementation is a user space application and is available on:
 
 DTrace is also available on Unbreakable Enterprise Kernel Release 6 \(UEK R6\) and later kernels on Oracle Linux 7, and requires the `libdtrace-ctf` library to run. The functionality of the `libdtrace-ctf` library is integrated into the Oracle Linux GNU tool chain for later Oracle Linux releases. Oracle Linux 7 is in Extended Support. Migrate applications and data to Oracle Linux 8, Oracle Linux 9, or Oracle Linux 10, as soon as possible.
 
-DTrace is developed as an open source project available under the Universal Permissive License \(UPL\), Version 1.0. You can access source code and more information at [https://github.com/oracle/dtrace-utils](https://github.com/oracle/dtrace-utils).
+DTrace is developed as an open source project available under the Universal Permissive License \(UPL\), Version 1.0.
+You can access source code and more information at [https://github.com/oracle/dtrace](https://github.com/oracle/dtrace).
 
 **Parent topic:**[DTrace Concepts](../explanation/dtrace-concepts.md)
 
diff --git a/llm/README.md b/llm/README.md
index 5e0feb122..2992bf7bc 100644
--- a/llm/README.md
+++ b/llm/README.md
@@ -27,7 +27,7 @@ The goal is to let engineers and administrators generate working D scripts in na
 
    ```
 
-   Make sure you are using the DTrace binary from the `dtrace-utils` package, _not_ the SystemTap compatibility binary:
+   Make sure you are using the DTrace binary from the `dtrace` package, _not_ the SystemTap compatibility binary:
 
    ```bash
    which dtrace
@@ -123,7 +123,7 @@ This makes LLM-generated scripts safe to test and explore on production or stagi
 
 ## Additional Resources
 
--   [Oracle DTrace Utils on GitHub](https://github.com/oracle/dtrace-utils)
+-   [Oracle DTrace Utils on GitHub](https://github.com/oracle/dtrace)
 
 -   [Oracle Linux DTrace Training Modules](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace/)
 
-- 
2.47.3

