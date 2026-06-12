Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F228B3E16B4
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281350; cv=fail; b=sowIEwc5Cn37vijXCNMrcL8vykRU0VB/eKL0k84wrCIhgeJda9lYoKfqJHV1RivQGaBKFeTEeglj0Mm00SJFZM3JWKwukGk61dLr5ZicyJW7nZkBX1pNvvIAb66NVyn7G9NqwtoEuZ77Y4f+vxsekVb145Iur3Sz1X+rizD6bFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281350; c=relaxed/simple;
	bh=toU+vsqQ4gnT/zsYfSAtDG2laPQWwG85oi8pX1nO8zo=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=KhiEWVdpuoS5kO18uGx8kPdt2fbrJlYVrVm7fPCguV2/1L+hG4tN/DnLxfuLyRD5rIPsiMC5IJYFhz4Qut50uC95cbsRS0DIK/8p7mKbe159flbtNWgk93KcPYtaT+Pyh8dtAsfRpXFVWAxIUEtRfIJYzK7l3UONMGnOCcNJGtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=An97QBIH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Rnkjj6qL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="An97QBIH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Rnkjj6qL"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C7Mbrf1151204
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=wRSrL4J0RfdN+Ux94AHkPXPVmx5tnb3K1UQ2UlH+TPg=; b=
	An97QBIHLzeu8byaJzqHf6nD0FLTeRFtBgM+4qZHtUBbcxEkpdczWE1JQsj5aXBI
	P7HsB8s1HCJPdNp9rw2gUZQyoYDiZEsl2yCf2+CPDbmvriXuIOzUo7iWiPGkqKrY
	DaDhhRMFQCzan2H4Pxn7ck41e+Z32z1XDcnzswqeECkC8Cfe0egPMF3eTlStSmBE
	y5i0JGeU08DbbxCft85+MqFXNXrOVvsvZpXq30tlEWRXQk4fabd00wJkIB/9TqiF
	XONqJ27SEKlaxAleksh0HC/R2frfrmL6OQo9HVQbJSJt1slIDKMjlq8L7umiOazi
	t+0oduHi6MYi7AizgeJLOA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe76u7xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65CGI9kW032897
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:24 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ergsm2wqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqxHjEoIScQv7YiXQRPl2Da/BAKnwrPIjc8mIAHhhmUqfqkhe57dSecMb1QvFUzznbnH/PkBSgRnC4MGBvXt0ldIOD+8ds0/rdD3EHvCqJywQMYWdYSjVrqmq3Ii+1MyAtmPDtCaOclUwT1f5AxnrslaLvOdbSsktceBHeJwGt3T/B2QUalW991ujmcVQK18RA6x5/4SPzF8cTzGgk2QJD6AumxPdzbptjbjP4aDep/Cp45whi37txmt72yfKeW7TBNIlfVyfycZN3QAe5qyqoj3iIRXCT3TtwNpK8igo8KaoY/kLOQMn8/t/bbyg96QIj14iCbpT/H1OMAFkRsKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRSrL4J0RfdN+Ux94AHkPXPVmx5tnb3K1UQ2UlH+TPg=;
 b=nWuK7GNOpEkiN8LtJsEYQFd/bRnhle2zV5a+1cbRDr5RH2DlPnYf7XI92EyceJU1qi/bvB4o2vH/P5ZNw8A+FhfRsfqY9YOplhGWcklvNlLXU2Pod/91uSTpMgzI4jTR0JGJBdARz/Z+aHlCCX8NDlhGATf9fmx1SqaoHuQmvJwY3/sRKVVTqFIxJbfoJabzMngpOVj2DX4MWJZ7oaaEAAtsX5aIjCjIzdDm3yGA+lz4/UKX6g/vuFXI25Vc+VA0FNlHLWdiMaWmf8Qg+lrvEsfafn/3ruEqtnNnun64ER2oGzCGWcIDYovV6g0EeNXmUuJ3XZYl5i0MCNiw0RvPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRSrL4J0RfdN+Ux94AHkPXPVmx5tnb3K1UQ2UlH+TPg=;
 b=Rnkjj6qLT0eUAE/fAy8TmlNpKbopkaMKxwaZuDijSPlny6nKvIrLtePevkyj2sFG19iPnMkGcby+RlXZo0nF3h/D2EhWDdOaATnLHHqggbZIH3ynpn4iSH/m9xdwyr9+gq/+QvvAJ1RiPtogX2SghgKCIOXpE5BfB29+Vgxdww8=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by SN4PR10MB5637.namprd10.prod.outlook.com (2603:10b6:806:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:22:19 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:22:19 +0000
Date: Fri, 12 Jun 2026 16:22:15 +0000
Message-ID: <35c653a0b4b57ad6c2a7faef8268e046@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/6] dtprobed: fix dof_stash write failure handling
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0137.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::39) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|SN4PR10MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 0989e731-f5d2-4880-f0d4-08dec89ec67e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8bEjIB85dyAChILJc3eBIfiz5syYSWDi/t+0kukpxHLTHRQWk+bu5l+uoWhMl3Ypt7rEUrndfoJJ6sFr0FUCuUvqTS7Roj/JN0dIgNl7QQ78cV7hN8kG+vw8/CLQQVobw7fOr56Np8bPOZ0nX09dI0gRf21gABgjyBLwZFS7b+0hky7BSR0oYrnNSg422O2LgRNnrn2VnUMyrW10NDbLPcTxxQN5NN9O2LHqOryOXCZ7i8nGRC9WhyX/6OEThGPyuutpCcCJQHJLHfV2ggnlv36PTrFdckpH97IX+DCqpDX+mqUncz55F+JvEWI5dFqznPSSYj7UhVHNiRaw6E/ZgKHw1YMuOd5ns2BEm8LHxrHpvuw4wH895uYw1UHEkgNV/HmMjbVwqn6SlvR6YobZ4lLHkSPcplUky7Anfru3aMdB6b4nmbok2dUXZJyowYN80fK/oTptJKT5t86/Aq9kTW0ATRGgMY64IUXyc4m0q9Dg1aVpA9CQWbmfQDvBZ5r8EfCkov2OnL8onNhmt/Ssk8lTxdeTjnnC1dqOPztnt/gne39PgznfiCVCQQwcxmvM7Kiux2gplwW1Tw3ps3bwReJJAXJuWiheCAhS0UsoZtfn8RRj67Of/IzQ2AA8SzfKAdpSurXh9BxxpAAwSv4ItbbCtbH4c11yPHUiwrA0HFV0R1+09NnD01wjLNe6DoIN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BQWVHyPcKwpuyk9VPRGYsI6qaFuq0cDPbTZWULIpfnZGDFfQBnXKZCZh+hUB?=
 =?us-ascii?Q?/073Xib2MFGncmXPALIGe5cvWMpKmVm1NXgDZsIlBGWP9sr40cblBqlrfAQl?=
 =?us-ascii?Q?hhT3T+jL1519TgQpHuom17BIXYQp1TJgSqtss/pcAdGjzOxS6Wm5dbOkLtme?=
 =?us-ascii?Q?DmKTFwDtQgYRFmpBrQhWQ2jvXngGm4jsN56JsagbckzAbzRXhFNo3Dcxw7c4?=
 =?us-ascii?Q?CV0UMISU0MMprimpnUuxZvIcP9/DW0nfz5a2LKmThEOwN5e6Ve/oXAdInw1M?=
 =?us-ascii?Q?70zrF1o3rJlNunkdi8wLPn8uJqGt1DLl8SCb/sgjVnOrndIIdnKPdLfaC4ei?=
 =?us-ascii?Q?5dkumqKY9P3tP2+y83S8N+JAa+pxqPr6o/ezNdUXmc0zHWA4zZnvc9j4AcuO?=
 =?us-ascii?Q?eYRn+xxKHRzWOpsqsPoXKp8/pRjdSkGAtF/dd6HT63rw5qxCplb6lJjJxRO+?=
 =?us-ascii?Q?bm4RJs+s52vvugQxTm4vZizpyW0wniUOpIkOoU2iRkxEbx6fHUddwvT7BeDh?=
 =?us-ascii?Q?O6QkU69rUC0wa1HxBTI3y1y3YFlgCFRHVIQDhMKgG4KJUTyH6xBq6KusVwSZ?=
 =?us-ascii?Q?Hg6qwfS00CmmhmhGkzW7HKc6UJX+I1qeAoO+QnKJ64pd+4hrk4yN8eqZSFKL?=
 =?us-ascii?Q?3l1ibn7w1M4aUUeCv4IpfFDh4iAgwS1X1l1UbLTwRyehFGcBF71DTghe4QS/?=
 =?us-ascii?Q?d9Ky0b7KbMwLA7ihQ3Qw9Q7kbBPtXHink5JPOWYTjNnAAMkL2UlTWWtAvRf6?=
 =?us-ascii?Q?varnzm+iQ99+qbc5Kykr++rjTobOwfn83/LRq6j4RFKAF12z5RUYhkKxHulR?=
 =?us-ascii?Q?d9UrHhAoFJddIP1YJvH4bvDSJBwnr1Q8WO1BaX1Ddd/kk1R5v1KoiFi3mxKF?=
 =?us-ascii?Q?dOEOqKpHgqbdKu9tNE6Ax7nPDrz363thE+N/AI0SryOx5a2Yns6ErGnjyYly?=
 =?us-ascii?Q?YXqhdX5I5MnY6Mdy+ToHdGXGy80VsIwBpi/wKUQo1puFE+fy8CR4xUWjjiX3?=
 =?us-ascii?Q?SDFJT4fYkMfDUkGpGVrjSCWKJS4Fs1Kv6lYARkY7r+YYbq5lVXMZj5kOoC72?=
 =?us-ascii?Q?nR/VeCgssKHLZC7ozI3bpuG1zDD0XuOielw7Tf3UWL8fQgb+tHXHa49pcNGO?=
 =?us-ascii?Q?bATCsQjNx4XicgFi/8XQKmQwk5XtEINYsGHVYEVP8svYUd1KyJVKA4XRnbaW?=
 =?us-ascii?Q?NRTsTtC1EXUmESrXMD8YHfPhLq6HddP0U8oBjhPmOuHQwVhzgUDvM5VSe/2W?=
 =?us-ascii?Q?mSTKXyagWCGEejy+2CIUjMn1sNsqwyQtd7/bH0JT+ZmndJvZYi97ge+/AUw/?=
 =?us-ascii?Q?AvmgW6RrdXPaIZU5H7cO2idZB1daiGSJW7mnyb4+H/iGNG2mrhW1SaZXhFap?=
 =?us-ascii?Q?sR3J4+DldKZEGY18UkH2AZVk4EJUZw6y3jK/zv3PUmDoBi6yGj9YC+aTGuwS?=
 =?us-ascii?Q?3TwLyV0cJGRcYeYTIVaKmT8fjtpAYqmjXRUZYylK2UFFUEvRBBmzZbLtSxDG?=
 =?us-ascii?Q?sYRW9tJHzUcf/lKcBR/GQ7JRHaMEI2HNWD7CmmWQitG9VmDDIlAWhGau+/OI?=
 =?us-ascii?Q?2xgm4oRfMFnmipCgQqdaKqqjKhki3b1PSR4xyzIo38zC8J/4CiUclHfdX0wy?=
 =?us-ascii?Q?LgVwKhsiVOqGsNlz/EeUfeBdxhOZYD+1BgjWUz80QdWohInmDP0p7LJ8KRyZ?=
 =?us-ascii?Q?k6HrUVBrs26Vt5RMMKLQcOzE8bc/lT+ZT778+UUpqT8BP62qNlQBfWYSDDat?=
 =?us-ascii?Q?avo44Uo0lqceB7WAs018PnxqZFZ83Oc=3D?=
X-Exchange-RoutingPolicyChecked:
	Dicv1MIPIN+frBvVOXKQVq+tytzRe9Xr06QJrUcnoylMge/YzMXQEEI6fpF0tA0Ki61U3qSnN0DcTpkEmUI82GdKRAer57eZ3Qael1Rukpqkplnmd/nNdZ28uyb/QmJsU49U1oXuMV053hOnfjXaADzDRN4IBR5DU7ebCq3nTmf/z5xHdVwhzWwotw8XIfwDiqK5ztiCE/xkT/+srutAK/sVvVhw+R2pQqHUm9PgMVl73eQo2oFUSarl5VR8hrlRtbigtHmSBQVkCebC5YW3EBy0Rfb4QuAXnDzRfHXgz9vGZ+dKphEccCP0Zpdc1I+aDzFzVm/Wkl3+EiW5ihqhsA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	so/3H+W0U4vlct1/sAbXcnzm5KfGzPakaigs4aKhC3VUPPOgXFdSjzhB9u5SOILYJd+/EuCTpt+RchrvBY6IFckAAFCYQu5pc+TWy1R3xs66bkhxf76z4a0ucyl9aWFpWtNln9m9wgzmd6cNMhSRU68Vap0oFZQLQ3xiN1kcyn/WDLN5ZNCq+bZ1QNoge5+TI3vx2BpIuZMxFVwhmjf0EZF6LnVywqhnoECz70MyID61EpwYGxIk42Ysi+XFCQsUsTzbfllVfJ068pQemub1nDkkWfekBBCf6GZcKGkAMCEW2QEqfDq2EpX6pwUHO72El07HcCHa57a9sckCEXBuFIr6nwy0Bb6Ldljc+qNHS4mFd1FTYNAuSQtkFgpqCwTHaFFqEiXsb7Nqx9yHBJi/NgsrdojYSbuwtZytN5cGblKHGJ+0zf0MGkInJDnNtRLzKSnek9bXuxdHB/rYnBl2Wfqlq+DpUZU3x8mQ54RuvBZIPILdck2zUvo6cgGqcYsnmS+A2OM909Gt7h4MJZKZXqAgSr1mycKsMlSpKgnjU4IVnJJvxL5+YU28XzwEboxH1izhTlkgiS1fZirndiJ6HduWqifXa02kVeKCItckw0k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0989e731-f5d2-4880-f0d4-08dec89ec67e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:22:19.4614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye+HQvCku2Zu0WLxOGlB5B1I2fbRR0ENaJRtjyxUjQpAso+gZp2vYpAklIYobe/jrib59w4cJRCg3v9HHhIXoTrmyxWsQexoniBVuCmyCtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606120151
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfX8ZTUM4oOeywr
 ohcYf+QsO7M8WunYGDTsr9LydbA7vTQfYrFR56rbwFbYW89lsbYdk7j0XtUMEmS+CKIwbHzuU3H
 07qEswAW9MYn6hF9tNJlgKdrcl2u5sjfkOvdZDuxOa3PmqnRm+IH
X-Proofpoint-GUID: YxPwCIYX9D7-MdueGu4QgdUHJYmGkWIv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfX162e6n33HKDL
 pJR5WA1AZ72JuYCnKegv+MorraUt0BIx4lEStA+m1qczlIe/IPqpkQIJJfHI2JWjYX1EomoAsvh
 yX8f/exHyJMqFkH4phK7fty+zv5XJT6oXz8is/QNa2LmtJT8wIhGfnw31Y2UH01z7nkR4DzIwbc
 /C8V+ccfb2tJXoRakOyEDpPaYCduHfBcwdsE5cy8bbG1OF1/mAGa18zo+m2M3VzQEGcmmI+5pwj
 yqrSqWYcXrgdV4ykBHk90gSdX2eCUcBymGeyc2J4nBF5JQyfJOi6WU5iXleGTsWahoUjmWvdfo7
 BnxUZuP7LHjPaTIY+MF+aOj3aGLJ3vc8XyNC1vaLo9Wm3jXlphdI0IqZgtHr1ZoTsJJAOy8+7Yo
 WPodlyb4tHpvztpAHvtoe5g2sM0rkSGH/OfKN/l0+PP3yWlRGCHZN3Q6NuZyDsgg2z5RTqpPI6e
 v+HMAifkGRbFzIqsHPA==
X-Proofpoint-ORIG-GUID: YxPwCIYX9D7-MdueGu4QgdUHJYmGkWIv
X-Authority-Analysis: v=2.4 cv=dtTrzVg4 c=1 sm=1 tr=0 ts=6a2c3240 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=611DKdg8VLDS_sa-SRAA:9

Use ssize_t for write() results, retry interrupted writes without treating
the negative length as progress, and unwind through the provider-close
path if writing parsed DOF fails.  Replace the no-op assert(1) in the
corrupt-state path with abort().

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 6e62bdf6..144cc98d 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -420,10 +420,14 @@ write_chunk(int fd, const void *buf, size_t size)
 	char *bufptr = (char *) buf;
 
 	while (size > 0) {
-		size_t len;
+		ssize_t len;
 
-		if ((len = write(fd, bufptr, size)) < 0 && errno != EINTR)
-			return -1;
+		if ((len = write(fd, bufptr, size)) < 0) {
+			if (errno != EINTR)
+				return -1;
+			else
+				continue;
+		}
 
 		size -= len;
 		bufptr += len;
@@ -796,7 +800,7 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			state = accump->parsed->type;
 
 			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
-				goto err_probe_link;
+				goto err_provider_close;
 			break;
 
 		/* Error return from parser.  */
@@ -817,7 +821,7 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			 */
 			fuse_log(FUSE_LOG_ERR, "dtprobed: PID %i, %lx/%lx: internal error: corrupt parsed DOF: type %i\n",
 				 pid, dev, ino, accump->parsed->type);
-			assert(1);
+			abort();
 		}
 
 		free(parsedfn);
-- 
2.47.3

