Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBF1249EB
	for <dtrace@lists.linux.dev>; Mon, 30 Mar 2026 01:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774833234; cv=fail; b=WEM1Zk1IgZtru0zb4LzCn2CRn+sOUKp0o2Plr67PUa/XlOKSKinajMKQ61HziDTcMbHHQUQdEaY5wTu/dLGZK/F99cx18xpw08fPMgM+PYfABfHzfGsr/Cnfkq8sFspCQQBNnm7a/1p84fjB41oNYUmoZHeKaYGjoIuiDs92Bz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774833234; c=relaxed/simple;
	bh=uL6dHS1uuQ2aqJ4/WnJSSMv/OyTLaCfcOKHCKI1NnDs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Zd+TRDjYM3gHnrCZEXNPmLXIp1q7BecLxO447rbWKlTrmQ4q7bMDSQuVXEqg1TrdvX6aYnGIGaHQZx3JS3D4OxW5m3MAu1Kr8YSpBkIMF6DKyqmQ8KKVNZk4iVfOSF4waC15vgZn0k/K0cf2Kb11QP9IUHXLx4W6U+vBizM6+ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sdb0wkV8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oOiYlF8H; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sdb0wkV8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oOiYlF8H"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TNADkJ1281538
	for <dtrace@lists.linux.dev>; Mon, 30 Mar 2026 01:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=DSiVZxIO8OtQlmRrOqSBsDu/ujNIZoYZ0s/GN6k8qQ0=; b=
	sdb0wkV8IP3paZJQNr84bDS7/JI/l2MEd4rKBn1BU8L8VZOnu+kcbF/P+BUkb+Ae
	RM5PUAtr3ytHZvk56kLa4OyepXzN+IncNdLrbyVSOFrtl26/+HezjpYAn2jKPLAz
	6frrvDBCWFQIKGAX+nkE9ldyJyVfD+QT1ZlGE95szGPFg36+AO2Q+3nMPw/oQKE+
	K2E5Fljd7NjFxfGFwFjhrdnYboIh7l2PvtdMFoU5IcUKXua6R+Kw+Qqzdo2D9BUf
	0Fl8+5o/GSFVtWSBhaN1szpV/l8Tm5omR2CoKv6FKmwb4dw+0UNaFYOfSNrQQkpl
	G+mBah9x/6M7sxU/3FgxvQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d66v5ha6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Mar 2026 01:13:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62TLeKB2036440
	for <dtrace@lists.linux.dev>; Mon, 30 Mar 2026 01:13:50 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65eec4r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Mar 2026 01:13:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQN+IRCo7AFOU5Fdy0x1HExx0FMKK9nXBckU3jBuH8ntOYn79F8jv1yjKal2gqVOYKQMyyitaccfX4NDc5DEXQuSdVedE5XjL7EBkq+7HxbhYNzFEwcz6WvEe/EmV2jB1jh0NyhZcYHvkKJ1tcY7CAyQYsi5C6injMFMQPaVeKCcGcX2ktqphIZhT8Ie62dLI9qPqJ2Q8Vzbx24y23hfrrnfxX7eYpLX3fQcd2X2WsQYy8bOLI+oUudE+ShcbtwVY/1u1ZdUdSvh3uYl4VFwq9zsvOuQO7UdDBEkuMehZSI+LbEJYqQRFWVzC/6AnUULXPErDo8Oz3aW9cMXQ9sDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSiVZxIO8OtQlmRrOqSBsDu/ujNIZoYZ0s/GN6k8qQ0=;
 b=dIDrm0f9zIcaWZz7GL35C50mpg9qb0QDkHp3W0bf0Rl7Qy31hyIlGPETIEmvAQwBApkxzoK8GlRX8zV2qHReb09+2SVXtDf1DU2AwdKP06uE2EdLy5NVlVPQZJXqZOzisQWZTLEeqKGDCrcpJHR/hC2hXVZ3R3X/AYVfu2a0fm0aNEZCVRz1oYUItmqJzGpjhCB+54k0tnt5VWXxy+QCQMCYaam8wDUaQi2pHJe4gLLtd9yyO7FiTI5FqNDzbHFa/4B5jGW0lEzCsLHcGwGnFB+fyWRDll70crno9JxNX8lW+I/h7QdRnvcf+q89MMypW/DJGAO/9WYqtfFbzVCnwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSiVZxIO8OtQlmRrOqSBsDu/ujNIZoYZ0s/GN6k8qQ0=;
 b=oOiYlF8H53JHOgB6b3y0xINEsxYKAHCmiPgjqtei8jPQvy2kdZxwmqqu/liKTaNa6eBiYr1Po7fQKGow2j0EQ1U0vBq5U48+fNi2Yfj4j2kdYRubeflHcJJvZR/6YhvVWgqyt9y2id+fEfXjxYVLoHVMuLSlmngPapj3BEMAbdk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH2PR10MB4309.namprd10.prod.outlook.com (2603:10b6:610:ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 01:13:46 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 01:13:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Fix flowindent for "return" probes with multiple statements
Date: Sun, 29 Mar 2026 21:13:43 -0400
Message-Id: <20260330011343.8596-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0046.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH2PR10MB4309:EE_
X-MS-Office365-Filtering-Correlation-Id: b799fef2-a76e-463b-855b-08de8df9973d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K0c8oXDOtb3d8vtNRl5K3jlVb4nECQ1aQ/0NzKnQe8rpgTMNpgiXYwOdOT4GqvZy2cSUjEAPhulDVqraIPdP7pURZpUY6uhi7faczrv5DhRWWjWqX7QLM43LrVi3hDnFWKo8ZKTdzV/NHx+etMkoI8QwcFSraLOgJ3YDg+qAludNl2b0EXSSMgVMrQKTmwWnB4oBlFZoZdSxIQ+o7nQdeWIg0JrL8iYnIVt71FNR9Q2aJOUKSvgtEfv9zvxmsr3hZGED+zkQKvIijuB3k+ImSyB04GfmqP7Hhl5dH1a9oHf2082C3YTUGmDPZXw/4RTNBFpA6kZzlXzNYFZGi0TsszWAeGVb6vyDHIIro1g0Sn4/dSpW9JynCF+ffoB0BAQdT2gPqXUfiRX13UyAHuGCSzYp8sk7H/jwIKMIVlwoG1iOXYlSzF1uU+xzJddy4n6qAXdA3XS1K5TpAoTeYZMJo2WtjMKyiNCPmYgVp/zmojdHOE7jsG2qN+jl651MEvlMohyii7pOdTnbOyguqK91AQiUk9/6o0cXR2FJZz9R6I5GsQ0c6/eORcM9zvG4FesbtqTA9ipo+w9buKkSfpaKnBiwK38PMr3HZ2eVQYG5RuZyvtwub6mrdJ/i9Ca9h9NE1ROhzPRMkjqg0Bdq4l+DXd6N2jGUlgpRg+B8t+ThFea1YBrN6bteP4MQeEGqoWGKV6k9RoMNfiVdBPKk4oqoCjahFW8XD9Bg5Eh6IGzsp5XEBy7RwmdSHJRPBGalBmBm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Wnm24KnuzcUv0H2YP5P0LEK34CT7RfMZHt6uGj/shT03HCNDXISRJpk4Ns1?=
 =?us-ascii?Q?TBjWUk9POvjkoNQdW7L0BjJdTzRZLLj2WMIQt9iRdXHbv7Pc+d84YLvyhGD8?=
 =?us-ascii?Q?ZRgQui7+ubq4Ioj1FpMASdhxiLP4UHpFBiAjEwnZK32sTPm05EXE9cHzvByV?=
 =?us-ascii?Q?K7HuY8NUolCbUK9eaVH6ydEh4U4IqaN0kV5luPTvGwmVXVGFCzqewkp1jvsg?=
 =?us-ascii?Q?0IsWa/zxeQmfEQhmzfmwaE7nLssL79se3Wk32t9+PyUYBYjYGCyueosz/HS1?=
 =?us-ascii?Q?foUqmVgP9o3Nvi1ueTP/9vxurbzYacuT74BW1/4wo/dwhNh9ID2P3h+ZJgaJ?=
 =?us-ascii?Q?RFEVcdNj3dGRJ8xZQ4KbqLxv4RQNQGOXTbIm96ndernAMFjpV04HcV2t/Hnd?=
 =?us-ascii?Q?e0zU9riuCOgN9KBOi+fSmuN0EnwSe0ckfjwwcQaTu+z4DQLrzfSJN9MXmloX?=
 =?us-ascii?Q?pBOmyRjQxNX5I9XJb7u9DBQnVXDqIAf4fWCHrR8293pMZ0IuZTk6eDGBdutx?=
 =?us-ascii?Q?PO+6kbOpFLslvAtYTyxmrCGDKUno2DD/QL7XrY7nWUFWeA8a7XWciyZbIxI3?=
 =?us-ascii?Q?uiWhNjzc5cDoYxr5ihX6NcCHV/AYfU87OaEKCiYnm3jwNXqOML2IsFPHX465?=
 =?us-ascii?Q?uuD0mmqwzS52sROGNh3wJcQ+WpE8drxCPR2+nOYAL/VMLw496XJ1o0thELkt?=
 =?us-ascii?Q?G4/ODq9b4U59S2vTq5COyJkN9IxQE3LeatC9c7yFiK9pIzPKvKnuXVnVHgIo?=
 =?us-ascii?Q?9Lm74uWnlpovZcgqM8cShuV7s4dfz2AWBtY1ZYXCtk67XdLA8jianCN89uj0?=
 =?us-ascii?Q?nQocKmfhN4NRpS5g8mZQcLk+D83OUxwq6/tiiI5a9GWLh8G1IIhvErsIqzSO?=
 =?us-ascii?Q?kRV3tGlzZFtY5V3XHQcjtSWovHpxihTtxubkoTb6gh8SGAPNVY+goJPMrEzf?=
 =?us-ascii?Q?QCLEaJ9br2XSVO2BvIVhjki6kZhtetiiex1iKH1jdsCDbZ3u0wRFAUQUTyXM?=
 =?us-ascii?Q?nvR5yR9idfNquipJ/tGb1aViFPr3EU+TwuykVh3KOMtHcFAxDrz/d3qMBIh5?=
 =?us-ascii?Q?xw7BsFXsTKv4p3qDFp6q0AUZmICPuPkZbCHKFd7WxVRzmlw+Tyvj0X3imHqN?=
 =?us-ascii?Q?RdtSAa+IN9C/6xYtmUgPmJpTQW6hCtFXr4k3eNsJNOBIZo50f8zDyCKq52A2?=
 =?us-ascii?Q?dSts5E8rfigQvniZvmrQW37YP3bPiVLZHyPIsFg2J3BHO/4hBex97Qu5mLyW?=
 =?us-ascii?Q?s4+F1Ji8ZHUjOoOf3AYfY185cBBNYDLvBXtgjBLq3zYMnMVHbrpnjtpRArW/?=
 =?us-ascii?Q?4VjTmVs0OzeGHeRk4jcm/rHlpkJLI9q2dn/ceQinLFTukoxGAG4fR3zc5E2s?=
 =?us-ascii?Q?EzgmV4j823fF0YeXPo+lvoijpY78G2SM3pIsYp11E9ZEQbo8oAPy/zbVbacG?=
 =?us-ascii?Q?9CkS1KOXtEpaVDFyn4vV74T/DVt6Phg7m46HuowpmTBy+FGzwuCEWVRv5TJI?=
 =?us-ascii?Q?ecROiCPoeZDhsxz/i7ClkN10OTddTK5umWfI2NgCPFwB6rnQURNbPOyNC3+O?=
 =?us-ascii?Q?XmuYlPbLgly/03MBU3ewqQO/US9b0KqD0T9VICplprnBgRCBMzb4zPNQ5UBT?=
 =?us-ascii?Q?2N9ud2Hi/qqOYB0Qabf00+a9/GU31oaChJKmYxyr4X8gzZx4TPNNFfjpkKD+?=
 =?us-ascii?Q?YNTA5kj6RxRWj832YBQAFviVCJnoun9enhDYBFmek0fn7UUltPpYSRmYsjqb?=
 =?us-ascii?Q?mHhztrM7aQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	Ix72L8enRyTIkA3L9Ltab3Clhe60Kwlw66CZV2Ba11c8CnwDLCVN+xOtjbzE5+mB6da4cIDeIv28AX8oKdVWaB14NgimQDhllt+n9nS7hQhpriu1rlm+Dn73O7kfyzNGmgkKroWujQ9hm+TOH/bxaldXvBY9L3JJDDludQw1m+4VhPtiG7nSoy2MzER8UGJRyeZ1lEKnHVTPMwaAMH9ACxFLknsTyCKDr1KUhvwlfOTH79xJN6jDPn5XkHQRyWvO1eBUPfqpsQq6jOEAf1QS5kx/4yAm3eybwB0K7rqO2xp2o76ZDvY4sOyYHotoXQGF7QWWNqVnUORrLB3zSt7mxA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EVehZBRksWjuGh7S57z1AMhBCVpIbUTPiKM3adwDqB/5D4TUdRyyNCsHsqf/9s+PrHZug+Qo11Qk6tlgfE3zMEW8cMywjDocuuNwIG9DYbpDU7LpR2gMMTLyPRsVIPfBqQ+c0Al51p2z5P5JDZv2IcCv7Zoo2lPG1oNpbryJUSEhQm1DRnL/NUrSaUDm+ertiXazVP40b+PzLi6cLRhUoyicE+D7weil6O9el0+q66oweN3/JhN1G3WuWnvT/etidrACtVTc+zh54R8Wg89ovVCgXoUjpc5M9SQW19VIHoH6JnV/UmekItifipbVZufIhY7h5H3eE6wdVVymWUBOKzYYWpJ1Q4ebPdDkyL2l4Aowh/kCZVb6SblAX5MTDE5IH+kC3WAx9a/fW7c7q4cZp7JZ7hSMU7ddTcwFifLaoMBOQzVpy2hATkkD5pLgiTQvdDetL1essbIhdzlzumPWN30OoTsLVXxrLvG1quFy62hiYc1Ph/Od3KQX6kLympnBRI1xHoBFx4IYyCnQCiz9Ow0ItRFrZtRL7NoIJjeJ5s89bqXZfq1bClZOfZ/uFRFZXdQrf35eAE4xCayNa9oD6Nntuty8EucTmtVAkPn6He4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b799fef2-a76e-463b-855b-08de8df9973d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 01:13:45.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tnt+xpYiPALfSEvD3+CdLiqaw25FRprYMGSrF8aQWikdxnkTPvJ9tGuMygQAAqNdFmzcEAgAsKH+iCvhuQreCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4309
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603300007
X-Proofpoint-GUID: vfVGh4D1VseIw5JZI-9JIofphYyTHO0w
X-Authority-Analysis: v=2.4 cv=G7cR0tk5 c=1 sm=1 tr=0 ts=69c9ce4f b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=-Nk1BllfUr-ncC-c0I4A:9 cc=ntf
 awl=host:12276
X-Proofpoint-ORIG-GUID: vfVGh4D1VseIw5JZI-9JIofphYyTHO0w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAwNiBTYWx0ZWRfX7/w66vPs7bo1
 5ByGhYJgrLRNwvs5ZmNi+LKCzjrI5vr+CZSBjM74zeFTNyGNRgCwJtngm/AuuMmPEdlkLQ3mefQ
 9Uquw8qZqu8VGiEZa/63xe/P2/Z+lDhjNDVWH/115b2HxKqo1uwv2Wu2MSTbMjJOXtd5Q7wvTfQ
 qvUU1VKJg3wH+YUbnZITmzKXqQdXm8qArP0/pzOxK2aro1Ut5pmdpcC0S8pC6NDHCArk8BhUEg0
 RF5hkhbHWhulsI09Gnon6p2WH5Yx/jAaQmRvR9Wx9X+O4ntDAj7tsG0Ed49TCZN+qfSTkz27Cow
 BXPVZfiTbOJ63MICbgn91Zg4B4doWGic4AxXsRMSEnBcdRKoZ3L/khO+xiXqUjwIf4aM+OUZed3
 3Tri+lKr+G0KtDtHFoR5jGdwdoc5dnKy59PbraLmnEtJgZAZ5hpMUnez7eju4ffwApqNP9CLM9A
 STv+XjGE3PWilFNbjJNg4FZecNgWkdlvxnxyueco=

From: Eugene Loh <eugene.loh@oracle.com>

The flowindent algorithm should change indentation based only on the
number of levels of entry and return.  So, if an entry or return probe
has multiple statements, the indentation should change only for the
first statement.

Such logic is used for entry probes.  Similar logic should be used for
return probes.

Add a test to cover the case of multiple statements per entry and return
probes.  Also have it check a greater number of indentations.  Since
the new test supersedes the old ones, remove the old tests, which
were fickle anyhow.  The new test can still fail -- the flowindent
algorithm is not completely robust -- so allow reinvocation in case of
failure.  The intermittent failures of flowindent tests have long been a
testing irritant.  Now, with reinvocation, testing shows no failures in
100 iterations on over a dozen systems.

Orabug: 39140395
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_consume.c                        |  11 +-
 test/unittest/options/tst.F.aarch64.r         |   1 -
 test/unittest/options/tst.F.d                 |  36 ----
 test/unittest/options/tst.F.r.p               |   1 -
 test/unittest/options/tst.F.x86_64.r          |   1 -
 .../unittest/options/tst.flowindent.aarch64.r | 160 ----------------
 test/unittest/options/tst.flowindent.d        |  36 ----
 test/unittest/options/tst.flowindent.r        |   1 +
 test/unittest/options/tst.flowindent.r.p      |   7 -
 test/unittest/options/tst.flowindent.sh       | 171 ++++++++++++++++++
 test/unittest/options/tst.flowindent.x86_64.r | 160 ----------------
 11 files changed, 176 insertions(+), 409 deletions(-)
 delete mode 120000 test/unittest/options/tst.F.aarch64.r
 delete mode 100644 test/unittest/options/tst.F.d
 delete mode 120000 test/unittest/options/tst.F.r.p
 delete mode 120000 test/unittest/options/tst.F.x86_64.r
 delete mode 100644 test/unittest/options/tst.flowindent.aarch64.r
 delete mode 100644 test/unittest/options/tst.flowindent.d
 create mode 100644 test/unittest/options/tst.flowindent.r
 delete mode 100755 test/unittest/options/tst.flowindent.r.p
 create mode 100755 test/unittest/options/tst.flowindent.sh
 delete mode 100644 test/unittest/options/tst.flowindent.x86_64.r

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index eca2139fb..8888af5f1 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -474,17 +474,14 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_id_t lastprid,
 	}
 
 	/*
-	 * If we're going to indent this, we need to check the ID of our last
-	 * call.  If we're looking at the same probe ID but a different STID,
-	 * we _don't_ want to indent.  (Yes, there are some minor holes in
-	 * this scheme -- it's a heuristic.)
+	 * If we're looking at the same probe ID but a different STID,
+	 * we do NOT want to change indentation.  (This heuristic could fail.)
 	 */
-	if (flow == DTRACEFLOW_ENTRY) {
+	if (flow != DTRACEFLOW_NONE)
 		if (stid != laststid && pd->id == lastprid)
 			flow = DTRACEFLOW_NONE;
-	}
 
-	if (flow == DTRACEFLOW_ENTRY || flow == DTRACEFLOW_RETURN)
+	if (flow != DTRACEFLOW_NONE)
 		data->dtpda_prefix = str;
 	else
 		data->dtpda_prefix = "| ";
diff --git a/test/unittest/options/tst.F.aarch64.r b/test/unittest/options/tst.F.aarch64.r
deleted file mode 120000
index 802f9b829..000000000
--- a/test/unittest/options/tst.F.aarch64.r
+++ /dev/null
@@ -1 +0,0 @@
-tst.flowindent.aarch64.r
\ No newline at end of file
diff --git a/test/unittest/options/tst.F.d b/test/unittest/options/tst.F.d
deleted file mode 100644
index 90430868e..000000000
--- a/test/unittest/options/tst.F.d
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: The -F option enables entry/return matching output.
- *
- * SECTION: Options and Tunables/Consumer Options
- */
-
-/* @@runtest-opts: -FZ -xswitchrate=1s */
-/* @@timeout: 15 */
-/* @@trigger: readwholedir */
-
-BEGIN
-{
-	i = 0;
-	j = 0;
-}
-
-syscall::read:
-/pid == $target/
-{
-	printf("syscall: %d\n", i++);
-}
-
-fbt:vmlinux:SyS_read:,
-fbt:vmlinux:__arm64_sys_read:,
-fbt:vmlinux:__x64_sys_read:
-/pid == $target/
-{
-	printf("fbt: %d\n", j++);
-}
diff --git a/test/unittest/options/tst.F.r.p b/test/unittest/options/tst.F.r.p
deleted file mode 120000
index 6260a34c1..000000000
--- a/test/unittest/options/tst.F.r.p
+++ /dev/null
@@ -1 +0,0 @@
-tst.flowindent.r.p
\ No newline at end of file
diff --git a/test/unittest/options/tst.F.x86_64.r b/test/unittest/options/tst.F.x86_64.r
deleted file mode 120000
index 509d38a69..000000000
--- a/test/unittest/options/tst.F.x86_64.r
+++ /dev/null
@@ -1 +0,0 @@
-tst.flowindent.x86_64.r
\ No newline at end of file
diff --git a/test/unittest/options/tst.flowindent.aarch64.r b/test/unittest/options/tst.flowindent.aarch64.r
deleted file mode 100644
index 7e745280e..000000000
--- a/test/unittest/options/tst.flowindent.aarch64.r
+++ /dev/null
@@ -1,160 +0,0 @@
- => read                                  syscall: 40
-
-   -> __arm64_sys_read                    fbt: 40
-
-   <- __arm64_sys_read                    fbt: 41
-
- <= read                                  syscall: 41
-
- => read                                  syscall: 42
-
-   -> __arm64_sys_read                    fbt: 42
-
-   <- __arm64_sys_read                    fbt: 43
-
- <= read                                  syscall: 43
-
- => read                                  syscall: 44
-
-   -> __arm64_sys_read                    fbt: 44
-
-   <- __arm64_sys_read                    fbt: 45
-
- <= read                                  syscall: 45
-
- => read                                  syscall: 46
-
-   -> __arm64_sys_read                    fbt: 46
-
-   <- __arm64_sys_read                    fbt: 47
-
- <= read                                  syscall: 47
-
- => read                                  syscall: 48
-
-   -> __arm64_sys_read                    fbt: 48
-
-   <- __arm64_sys_read                    fbt: 49
-
- <= read                                  syscall: 49
-
- => read                                  syscall: 50
-
-   -> __arm64_sys_read                    fbt: 50
-
-   <- __arm64_sys_read                    fbt: 51
-
- <= read                                  syscall: 51
-
- => read                                  syscall: 52
-
-   -> __arm64_sys_read                    fbt: 52
-
-   <- __arm64_sys_read                    fbt: 53
-
- <= read                                  syscall: 53
-
- => read                                  syscall: 54
-
-   -> __arm64_sys_read                    fbt: 54
-
-   <- __arm64_sys_read                    fbt: 55
-
- <= read                                  syscall: 55
-
- => read                                  syscall: 56
-
-   -> __arm64_sys_read                    fbt: 56
-
-   <- __arm64_sys_read                    fbt: 57
-
- <= read                                  syscall: 57
-
- => read                                  syscall: 58
-
-   -> __arm64_sys_read                    fbt: 58
-
-   <- __arm64_sys_read                    fbt: 59
-
- <= read                                  syscall: 59
-
- => read                                  syscall: 60
-
-   -> __arm64_sys_read                    fbt: 60
-
-   <- __arm64_sys_read                    fbt: 61
-
- <= read                                  syscall: 61
-
- => read                                  syscall: 62
-
-   -> __arm64_sys_read                    fbt: 62
-
-   <- __arm64_sys_read                    fbt: 63
-
- <= read                                  syscall: 63
-
- => read                                  syscall: 64
-
-   -> __arm64_sys_read                    fbt: 64
-
-   <- __arm64_sys_read                    fbt: 65
-
- <= read                                  syscall: 65
-
- => read                                  syscall: 66
-
-   -> __arm64_sys_read                    fbt: 66
-
-   <- __arm64_sys_read                    fbt: 67
-
- <= read                                  syscall: 67
-
- => read                                  syscall: 68
-
-   -> __arm64_sys_read                    fbt: 68
-
-   <- __arm64_sys_read                    fbt: 69
-
- <= read                                  syscall: 69
-
- => read                                  syscall: 70
-
-   -> __arm64_sys_read                    fbt: 70
-
-   <- __arm64_sys_read                    fbt: 71
-
- <= read                                  syscall: 71
-
- => read                                  syscall: 72
-
-   -> __arm64_sys_read                    fbt: 72
-
-   <- __arm64_sys_read                    fbt: 73
-
- <= read                                  syscall: 73
-
- => read                                  syscall: 74
-
-   -> __arm64_sys_read                    fbt: 74
-
-   <- __arm64_sys_read                    fbt: 75
-
- <= read                                  syscall: 75
-
- => read                                  syscall: 76
-
-   -> __arm64_sys_read                    fbt: 76
-
-   <- __arm64_sys_read                    fbt: 77
-
- <= read                                  syscall: 77
-
- => read                                  syscall: 78
-
-   -> __arm64_sys_read                    fbt: 78
-
-   <- __arm64_sys_read                    fbt: 79
-
- <= read                                  syscall: 79
-
diff --git a/test/unittest/options/tst.flowindent.d b/test/unittest/options/tst.flowindent.d
deleted file mode 100644
index 1ce1e26f7..000000000
--- a/test/unittest/options/tst.flowindent.d
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: The -xflowindent option enables entry/return matching output.
- *
- * SECTION: Options and Tunables/Consumer Options
- */
-
-/* @@runtest-opts: -xflowindent -Z -xswitchrate=1s */
-/* @@timeout: 15 */
-/* @@trigger: readwholedir */
-
-BEGIN
-{
-	i = 0;
-	j = 0;
-}
-
-syscall::read:
-/pid == $target/
-{
-	printf("syscall: %d\n", i++);
-}
-
-fbt:vmlinux:SyS_read:,
-fbt:vmlinux:__arm64_sys_read:,
-fbt:vmlinux:__x64_sys_read:
-/pid == $target/
-{
-	printf("fbt: %d\n", j++);
-}
diff --git a/test/unittest/options/tst.flowindent.r b/test/unittest/options/tst.flowindent.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/options/tst.flowindent.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/options/tst.flowindent.r.p b/test/unittest/options/tst.flowindent.r.p
deleted file mode 100755
index 1c6489608..000000000
--- a/test/unittest/options/tst.flowindent.r.p
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/usr/bin/gawk -f
-
-# Report only from 40 to 80.
-BEGIN { report = 0 }
-$NF == 40 { report = 1 }
-$NF == 80 { report = 0 }
-report == 1 { print }
diff --git a/test/unittest/options/tst.flowindent.sh b/test/unittest/options/tst.flowindent.sh
new file mode 100755
index 000000000..bcd5900bf
--- /dev/null
+++ b/test/unittest/options/tst.flowindent.sh
@@ -0,0 +1,171 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+# @@reinvoke-failure: 1
+
+dtrace=$1
+
+DIRNAME="$tmpdir/flowindent.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Create the trigger.  Produce the following call stack 3 times:
+#         main()
+#           -> foo1()
+#             -> foo2()
+#               -> foo3()
+#                 -> foo4()
+#                   => syscall::write
+#                     -> fbt:vmlinux:__*_sys_write
+
+cat << EOF > main.c
+#include <stdio.h>
+
+int foo4(int x) {
+	printf("%d", x);
+	fflush(stdout);   /* prevent buffering the printf */
+	return x + 1;
+}
+
+int foo3(int x) { return foo4(x) + 1; }
+int foo2(int x) { return foo3(x) + 1; }
+int foo1(int x) { return foo2(x) + 1; }
+
+int main(int c, char **v) {
+	int iter, value = 0;
+	for (iter = 0; iter < 3; iter++) {
+		value = foo1(value);
+	}
+	return 0;
+}
+EOF
+
+$CC main.c
+if [ $? -ne 0 ]; then
+	echo ERROR: compilation
+	exit 1
+fi
+
+# Run with flowindent, equivalently specifying either -F or -xflowindent.
+# Ignore the trigger (a.out) output.
+# Use a long switchrate to reduce the chances of interruption from dt_consume_cpu(),
+# which resets the flowindent algorithm.
+
+for my_opt in "-F" "-xflowindent" ; do
+	$dtrace $dt_flags -c "./a.out > /dev/null" $my_opt -xswitchrate=1s -Zqn '
+	/*
+	 * Probe on each foo* entry and return.
+	 * Report the cpu for more debugging in case of failure.
+	 */
+	pid$target::foo*:entry,
+	pid$target::foo*:return { printf("%d foo\n", cpu); }
+
+	/*
+	 * Add a second statement for those foo* probes.
+	 */
+	pid$target::foo*:entry,
+	pid$target::foo*:return { printf("%d foo again\n", cpu); }
+
+	/*
+	 * And add some syscall and kernel probes.
+	 */
+	syscall::write:,
+	fbt:vmlinux:__arm64_sys_write:,
+	fbt:vmlinux:__x64_sys_write:
+	/pid == $target/
+	{
+		printf("%d write\n", cpu);
+	}' >> D.out 2>&1
+
+	if [ $? -ne 0 ]; then
+		echo ERROR: D script
+		exit 1
+	fi
+done
+
+# Construct the file to compare D output.  Note:
+#   - Each entry/return changes indentation only once,
+#       even if there are multiple statements per probe.
+#   - The syscall entry/return uses => and <=.
+# Each iteration happens to have 20 lines of output.
+# There are 2 runs (-F and -xflowindent).
+# Each run has 3 iterations, but we will discard the first one.
+# So the cmp file has 2*(3-1) = 4 iterations in total.
+
+for iter in `seq 4`; do
+cat << EOF >> D.cmp
+ -> foo1                                  foo
+  | foo1:entry                            foo again
+   -> foo2                                foo
+    | foo2:entry                          foo again
+     -> foo3                              foo
+      | foo3:entry                        foo again
+       -> foo4                            foo
+        | foo4:entry                      foo again
+         => write                         write
+           -> write                       write
+           <- write                       write
+         <= write                         write
+       <- foo4                            foo
+      | foo4:return                       foo again
+     <- foo3                              foo
+    | foo3:return                         foo again
+   <- foo2                                foo
+  | foo2:return                           foo again
+ <- foo1                                  foo
+| foo1:return                             foo again
+EOF
+done
+
+# Postprocess the D output.
+
+awk '
+# If there is a break in the output, restart the line number.
+NF == 0 || /FUNCTION/ { lineno = 0; next }
+
+# Increment the line number.
+{ lineno++; }
+
+# We do not want to be interrupted by dt_consume_cpu() calls.
+# Therefore we use a long switchrate to throttle the consumer.
+# Since throttling does not start immediately, however, we also
+# discard the first iteration of output in each run.  We saw
+# earlier there are 20 lines of output per iteration.
+lineno <= 20 { next }
+
+# Then print.  The cpu IDs are removed for the sake of comparison.
+# The cpu IDs were printed in the first place since it is possible
+# that the trigger migrates from one cpu to another, disrupting the
+# flowindent algorithm.  That is unlikely for such a short-running
+# program.  Still, if we get unlucky, at least there is more data
+# for debugging.  If migration proves to become an issue, consider
+# using taskset to bind the trigger to a cpu.
+{
+	sub(/__arm64_sys_write/, "write            ");  # scrub arm64 label
+	sub(  /__x64_sys_write/, "write          "  );  # scrub   x64 label
+	sub( /[0-9]+ foo/, "foo");                      # remove cpu ID
+	sub( /[0-9]+ write/, "write");                  # remove cpu ID
+	print;
+}' D.out > D.post
+if [ $? -ne 0 ]; then
+	echo ERROR: awk
+	exit 1
+fi
+
+# Report.
+
+if diff -q D.cmp D.post ; then
+	echo success
+	exit 0
+fi
+cat D.out
+echo ====
+diff D.cmp D.post
+echo ====
+
+exit 1
diff --git a/test/unittest/options/tst.flowindent.x86_64.r b/test/unittest/options/tst.flowindent.x86_64.r
deleted file mode 100644
index 53800726a..000000000
--- a/test/unittest/options/tst.flowindent.x86_64.r
+++ /dev/null
@@ -1,160 +0,0 @@
- => read                                  syscall: 40
-
-   -> __x64_sys_read                      fbt: 40
-
-   <- __x64_sys_read                      fbt: 41
-
- <= read                                  syscall: 41
-
- => read                                  syscall: 42
-
-   -> __x64_sys_read                      fbt: 42
-
-   <- __x64_sys_read                      fbt: 43
-
- <= read                                  syscall: 43
-
- => read                                  syscall: 44
-
-   -> __x64_sys_read                      fbt: 44
-
-   <- __x64_sys_read                      fbt: 45
-
- <= read                                  syscall: 45
-
- => read                                  syscall: 46
-
-   -> __x64_sys_read                      fbt: 46
-
-   <- __x64_sys_read                      fbt: 47
-
- <= read                                  syscall: 47
-
- => read                                  syscall: 48
-
-   -> __x64_sys_read                      fbt: 48
-
-   <- __x64_sys_read                      fbt: 49
-
- <= read                                  syscall: 49
-
- => read                                  syscall: 50
-
-   -> __x64_sys_read                      fbt: 50
-
-   <- __x64_sys_read                      fbt: 51
-
- <= read                                  syscall: 51
-
- => read                                  syscall: 52
-
-   -> __x64_sys_read                      fbt: 52
-
-   <- __x64_sys_read                      fbt: 53
-
- <= read                                  syscall: 53
-
- => read                                  syscall: 54
-
-   -> __x64_sys_read                      fbt: 54
-
-   <- __x64_sys_read                      fbt: 55
-
- <= read                                  syscall: 55
-
- => read                                  syscall: 56
-
-   -> __x64_sys_read                      fbt: 56
-
-   <- __x64_sys_read                      fbt: 57
-
- <= read                                  syscall: 57
-
- => read                                  syscall: 58
-
-   -> __x64_sys_read                      fbt: 58
-
-   <- __x64_sys_read                      fbt: 59
-
- <= read                                  syscall: 59
-
- => read                                  syscall: 60
-
-   -> __x64_sys_read                      fbt: 60
-
-   <- __x64_sys_read                      fbt: 61
-
- <= read                                  syscall: 61
-
- => read                                  syscall: 62
-
-   -> __x64_sys_read                      fbt: 62
-
-   <- __x64_sys_read                      fbt: 63
-
- <= read                                  syscall: 63
-
- => read                                  syscall: 64
-
-   -> __x64_sys_read                      fbt: 64
-
-   <- __x64_sys_read                      fbt: 65
-
- <= read                                  syscall: 65
-
- => read                                  syscall: 66
-
-   -> __x64_sys_read                      fbt: 66
-
-   <- __x64_sys_read                      fbt: 67
-
- <= read                                  syscall: 67
-
- => read                                  syscall: 68
-
-   -> __x64_sys_read                      fbt: 68
-
-   <- __x64_sys_read                      fbt: 69
-
- <= read                                  syscall: 69
-
- => read                                  syscall: 70
-
-   -> __x64_sys_read                      fbt: 70
-
-   <- __x64_sys_read                      fbt: 71
-
- <= read                                  syscall: 71
-
- => read                                  syscall: 72
-
-   -> __x64_sys_read                      fbt: 72
-
-   <- __x64_sys_read                      fbt: 73
-
- <= read                                  syscall: 73
-
- => read                                  syscall: 74
-
-   -> __x64_sys_read                      fbt: 74
-
-   <- __x64_sys_read                      fbt: 75
-
- <= read                                  syscall: 75
-
- => read                                  syscall: 76
-
-   -> __x64_sys_read                      fbt: 76
-
-   <- __x64_sys_read                      fbt: 77
-
- <= read                                  syscall: 77
-
- => read                                  syscall: 78
-
-   -> __x64_sys_read                      fbt: 78
-
-   <- __x64_sys_read                      fbt: 79
-
- <= read                                  syscall: 79
-
-- 
2.47.3

