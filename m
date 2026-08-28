Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00C358D32
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943073; cv=fail; b=BHMhj6J0yvdsEjImtf+qBociIcmrTFaT4PHdO1XUShcmg6TF8hG3bSddoINZ48EB0nV3u01Em8DPrzSqlaXk5Kh4v7ccBHmjt38inyIhR9kwPF6I2lAALRu3BBTTbJz2IKVRVFRx4Zc3kmXNEau7jJcSA8Q9bNv8iPGD81yITx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943073; c=relaxed/simple;
	bh=/zu9Er9lSkfdaK0cxxpHn9n0X+vrQH3qRX2OkpaGqVE=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=CYZahVrTW/ct6AEspY0EWKMQM3GunX1WvIOG+Sh6GPQ62QmORh91eyN43fQLRFhWLpjdHHTT+UGodNmzEl/JRt7j7k9GZxo9sqfTBcIdbk8Up32+Ozx+HRrdOfwXjZ5TVcaPhFI+7mHuc72easoEb3aUHVxJkY1zgKxusGfmnV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Tf3g6rHO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XBm0tyuP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tf3g6rHO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XBm0tyuP"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHJvZF3166632
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=dPrahc0SsjxrfVDL5LmBGgXiURUPJP9twqbSivKkp08=; b=
	Tf3g6rHOrwD78NpSxNk1g+UYnaGv8J0FYHW2Mx++ps59VhweSQI+tvkTchcMThCl
	Hg98ozRFBTL/Ka4GYoSCMYu2qTS3DnbKFDXjM6ihyxKppzyjn8lY6aDASAo3f25W
	9PaKLYnnMolaLvTVzrOcoT6Iwia/KaFRrsyJ6Ts1J80B/OEwlN5RBDvaEd+3RcyE
	sJREHu24o6r3moS3zJE4X2sR+0cW+jcRCmyGX2DaySuvphJ1KJTw3vxpTn6XVTlG
	zPJFwwZaI+BM36/ICytXP0710x7cl1Hm82owFtKZHIklgTtkglLBZGRsd0+yxDM9
	FJjDTtAZa0pwsTVk1lviKQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g73ct2f1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:51:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SIodoq015746
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:51:09 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4g84kq529v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:51:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpXaf/ysZekj6ullj0x9d3GsCp8XuZusQ8j0QjzQffVLObc8p6Io5YtMIuShGVfTWjYuXxB9wFbcQZBdWbZq14DcSrF1ng9bSU715cl69TGOfp9kHz43nfAQnHSdmpgzeEVUope8ZthxcSbdWYIS/XIc3k59f3oEezE7fcZ5BsaQbcXGvGv5QM1o7kqEBaTBPutNHS6oadBFdHDUzFIeU862pm5ntrP7SdvSoBCUpgLYhz6vRwqxGuAyss0lT7+8DXTLdte+NBrTih12eyVPcU4o01u7GSDTk1xiyMhkHUJmBCzLqIPdhnXvZytOUsJBGEbjpgHjXkE17d8TrUzuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPrahc0SsjxrfVDL5LmBGgXiURUPJP9twqbSivKkp08=;
 b=bQKrPMdMY+ShMlZe41oRGj98Rl9lyLkuauB7rsyV9mQkQlrA6iJ3GHGtMRPwzEkJVVBAEv+Pt86ghJBieEuBGgwkUxO4aF33oCDPwAkbZUa0aJl77D/+8CX6JGR4nHGiLmWzlLH37wqSENSzglib8bEb88s0SeKlJf9E+opgnZBxAH/bmV8q+yqNAiVXNNCBQVWX7eodv+iusbmpLhs6CVjdjKW03Njp5KR2X5Yhbseya6o3qmjk/oz51FBKIFT1W35wzf9bKu0F/RtBSQBy9+9iY2b58PPb93piE+IutuZQU4BKTGZ/oY0OBmoHp8IVpO6LnQG7ddJtvAOvJAPMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPrahc0SsjxrfVDL5LmBGgXiURUPJP9twqbSivKkp08=;
 b=XBm0tyuP9DZM2dWflOhu7EQk2X5i1OYAE78HHEWixk2BzjtCB5u0qoNGKRUj4I4vfbqJ9snHooXyll2hDLKUf93WMPUWnyhq7YvtQjUJKYDPWjNk1xOiVSE97gYcxUasGpFxrthjuWZVRVq8IRDi1PUFTCAnLDubyH5etBR135k=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 SN7PR10MB6665.namprd10.prod.outlook.com (2603:10b6:806:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 18:50:02 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 18:50:02 +0000
Date: Fri, 28 Aug 2026 18:49:07 +0000
Message-ID: <45da1d96139f5cdd2f451d58f46e67f6@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] spec: make dependency for fuse3 more strict
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:610:b0::24) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|SN7PR10MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc9eaf9-2004-4bc2-e5c6-08df05352b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	os5gIUW79RJagc+l3aS9ry9kLmE5Cy+shGQHBvY0Ud+avfPjCrzz+IZVhNw47xA5bsrXxvbuSQomoJE5HXUOCDRKhmmRy+Yr/15M0xM/OHO17rHbSY4dap/RpvkIOmVTp1tVPd/DyxcOA0xDT6tX5PhaBwqUFcs+W2rkczKMw21Xx1ZVhh94BBzBcJtpkFk8gF3EsJHctzvFfSOS8mJidBoTw6uwfi/Mmt6JJCwznkHXjfDIAowxhxID/VKkIkPO0wXhpFlJC0lSRosbkRQpUL6cH27djhMyyFUQyiISU97lU4RMjQ4Lmhmo0lorOwX16lS/wXs6q+0+BoQqm6sgeR/HzMmZmmX1Hcw54mks3AB+7cCBBXW4GHEfN34XppY5xZSZnB8/oMqe+b0Kp4oHIHYBYB5YfAkukSgJUUmBn4P085abFXiJRgullQeqWcCScA7mS8yPqOWJHx5T8zrLqWLJJFTiDbsacl/rAqznj2qxk2I6tn+4qdhvFZl3xIhs4hy+nvGNRzfauhZdAR3zjDyxbYrFQ/grepYE3TXM9KWy3Vx7kP6fQpwp9i9hOXaiUBAALoWmqheCGe4fq1azXa4xrLRZQ+jsrkXz+ztt9ttC7q8Ae4BTMOpjtxPbt9us3TraJH/b+DB6YKOTHyvDlWVv8UpjkMI2T+cJYFe3NUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3MaHa5QgU1md0foJb38FCA6aoYtTiFEC1dgW3qt+x9LJzIM1c6L0GKQHbLg/?=
 =?us-ascii?Q?vTOGzlWl6LMddf2TyowmSopiQ9tOnDFiwiqOaTrVzT/PY3EVwZktwLozAmvF?=
 =?us-ascii?Q?d9947wDmMYPncip28qsYaxCnqgPvRkhUNPq3/4A7/Fbl0Z7Vt3yEKSlprBYO?=
 =?us-ascii?Q?DMSy6CtnaXD7UpJmpOWB778vhvE1AA4ogG6xzjaLZiaaihTVQTeCO8lxazJG?=
 =?us-ascii?Q?MqX0TJVEHRxWoshwSv9egqsFd1x0Mof3/LV6i6WuWXpc2u2S11ByGDqidxQ8?=
 =?us-ascii?Q?/i05ITw1vady9jA8i59zIkQgnpB9u88JeigfdaRI3TjMK8jezCdEJWd7sQLU?=
 =?us-ascii?Q?EPS653WbJuBUGXHTJHhIy6qp0AwNFSRKksKf5OBCQ+udFXn3XUP/mbOjNNV4?=
 =?us-ascii?Q?l2aZSlSxaL4xzgXavFYCl6lS/5uuSLvG+pulJnyjdXo9xw9n++dLirdY7w7/?=
 =?us-ascii?Q?covoqhKpo4MEshOitT5TsdG6CuEmjMsdEMEjIjiw3XI1AJdWNz88vXwiCXJt?=
 =?us-ascii?Q?o7iAQH0DsJyx2t9/Bc2nfWyxx1n7kXjFeBIb1iq4PX0LNK6weyyR6rU/5Vej?=
 =?us-ascii?Q?mGrHcAXKc++4XN8fgUkPpdEKQRJBmmMFt87IvKW8rGZMNuu8sRsL+UcbETRJ?=
 =?us-ascii?Q?+iRlzTQ7+c6VLlLkkZRbpzYjpnEcY2Gl1koouecpufzyAMjcQ81CfXyrgVFl?=
 =?us-ascii?Q?bELRkD69EGWKCePHxM3ctV4BIHH11euHIbZezqbDHVuRlJUably7IEXu4Hhi?=
 =?us-ascii?Q?LSjHoJwAo6yMVInwPkQRqwHwVthsGxy0NSnvVvEnOlyrndE+o9XTElzALbuN?=
 =?us-ascii?Q?YvgFLo0gkNB/sgscTbgP9EQfcmh2vtz6+9VpD8vuZzkZ7GInuS06Te6a/o07?=
 =?us-ascii?Q?W1g5v2gqhD/m0t7hlinzRkwlAYqQX7PqWLzI+v/NJigf/DTNAc0ZPwxubeo6?=
 =?us-ascii?Q?8EVdKlEzWcpVRdBhm2PFr+MxewnBzTMP1pWYDJzxQ7OEsgbTpp7L3d8zCbgY?=
 =?us-ascii?Q?mlG1FUE7p9Y5OxtbtpY08WSjoG++oSz2Y/+pCr8kXTRIG84C/tXu8j2dDIkt?=
 =?us-ascii?Q?TvfAtm8ypsNFg+lOmP9XXwO3dPU2V5vHg6jjW/6YZFEoHrFHXv5gzuPJkYWt?=
 =?us-ascii?Q?A1pzInVAAjGEJXGCvI8cR5MzqkMtzzp3SMfXZxsBKtLill9/2YmpDRN6XeLo?=
 =?us-ascii?Q?toPn0Ps7PKZYkIm7ax7A4lG1vQi6WM4QhSuq2HbaCCxyzOatJm/RlF58zEYg?=
 =?us-ascii?Q?WxAGpqHnPw4lLkQ/z7u9bOASjLhsBe/7Ilss0NXkXrAUAmyHUz0PdxIhU/SA?=
 =?us-ascii?Q?R80lGGkBuuLzcCYr9fDjc+UHTm9DYoyMLtexBFB8OHOq3MB7UG1Rgcj+QIYN?=
 =?us-ascii?Q?9WHJRK+M1Jbb51T6qF0ORmPnFA4/iPvxwtjtZ+OeEF4FoC/hEEomIBmEX8sl?=
 =?us-ascii?Q?OF7qjNYBD9IPChtEhWoK+nkauzPLrZroh/WYqfhKYcAfDVxJZA/qzTRvOZUF?=
 =?us-ascii?Q?JkDXSgCTc/dW69QGNizr/repcs3VvYuxUs7JGQxroe1z5RhvCMkgMKSU5AB1?=
 =?us-ascii?Q?7VwJjVFrq7q2rk8icDAopNeXTnwPtQD5Es9NOCql3uMSw5tmY+iXnGLZ1E9H?=
 =?us-ascii?Q?nZORjMvoN382cRO28TzB1aPkE+GhA9/BYt29yq7aYLW0GgG2Vq/O4vHh5uBh?=
 =?us-ascii?Q?mMNCxBP2qM4rBwnZVM5PEX05R29dTvgZfLK0GGKGZowZXw1shm9fNAzah/vk?=
 =?us-ascii?Q?/iCCnmuV3bRqMsUoHkxqvUL8q45776Q=3D?=
X-Exchange-RoutingPolicyChecked:
	eR+oT/3RhvmHXuA6s7/d0Jupp6tUa7igosYxvs/APFKqUvmPx68UpmS2SnI+wHJf+XXcj7fA1+FjfjnOtqma0YQTOQWpuMSyo6tVFw+H0PMm2C4yMvsmPgskURXTS7LUmav0s/6zMEVqIWA7kj7uhb2V1iMobQxccEcsJJ//iySOYxKPG49/qfyfDZRRrHLWygxbnvvD0ZNV0nlx8Vw41lyGtMkvK9ucJ+bvf4VIvhdZlUU3b4fLjErOKlYKvNfv8kTZ32kfivFncu/KoL7HxJu5Kwd51njSiqoYfBQBxRWiq5++8Izvf1ALaFE8UA51HkU/L555FKBR/6pPmeSBDA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HUxOaEk05pLCqCnUcKxCqGg2ji4YjaB9mK+/3gMuQld2tUy0eP2YfTsSURmgLuO/jkCsVxStaOqwTl3au48L8UMlW9NYJv/RLOKGuBkbdCxzU9u196hR//gGQaWi0rdrYCLazpIzWEGeYaXVl1Nlsyp6XKM66xvzoGztXG0TU4bv1JsJZ1eJbs3MLbmyRhoWPHfeKgl3Zwopon58685Lo8JxEE8J/BguOPCzIFpaJ8A3seRjZJwuCt6TgDb6BsPL8CSwwxY8HI83TK/sLXOe2qFEttJKI5AF5xeSot35PuW1L05V4uVPUq+16GlnKzXpHDqLEgG5tL+quFnecxAg0SE48o1NPJc93u5Qg2y9QtqNYaAC1uyTmvoDLnojyexTsl/+Og70Ex5+RdcZVcRzDkIPuDkWgenIP2aS6LFcdjtHzD38dArQiTJa8rLNJyWDsn5gbIEaA13/1G8Dt+NjcNphCQ8EU3LjzjjoVhJfGBCU89d7wXDy3z1ysYv4dc2isRvxRJskKSvAsLIpVjkn3eb3EKt1pOnoamQyAfVmXNgGe91HfoElcGLPg6GlBiSvmuAPkK8WAqa8aHISxc2z+Fv6q95HB3tGb0y5D8Fn+uo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc9eaf9-2004-4bc2-e5c6-08df05352b19
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 18:50:02.5611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nf3eeiuvBqOB+9jWz1q6qo48JQKWRMwPa6N8tZ9ynJ8XsbY/06qpVMas4VtLUhNCZ0B8+NvFD8RBfuF4/48OLacyR9prMaUFJvMM7xI6YqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6665
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxlogscore=897 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280164
X-Authority-Analysis: v=2.4 cv=D+h37PRj c=1 sm=1 tr=0 ts=6a91d89e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=m1MpwbZxHw_Nr05jpLkA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13521
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NCBTYWx0ZWRfX7LC1iwaSc33z
 Uq+aQAcWaGAC8A0bW4jvFg8A5vp8ZzQfBo3/qQHJJJypvOO5blfQzxMPItCoNxEbXiB04KeWoo7
 C4NRXxu/m8+g+vDNOUcUidmZF2FkkJ+P5W1Tz3hYKIBRq6Cu9Lsw
X-Proofpoint-ORIG-GUID: s3GkPHZPXgy3EAFDxrtLMTCuyloCKooX
X-Proofpoint-GUID: s3GkPHZPXgy3EAFDxrtLMTCuyloCKooX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NCBTYWx0ZWRfX5bp/Ld0WmtmZ
 LBdfmoZlQ8M38Z8d/w3N12jn4pOon74uyG4Rreb6mEB80JbbJCWbTGv+vuXMzUTjum5LHNaFuAn
 GTkGBZJOt7AKt3yugFD00FK/7tr/xQ3GTB4wuQG5DaMIzbZJaID7Sq7/+OTzgEriRCtoKbPqLdU
 T1pkUdZGBYKKCF+dU1CT9T3LjjGrXebiNHwpl5A8P9ua/2CIydkZwlWCRYxuTwvBqH+rSyqREnY
 Si7zleYdGlDu+z8PkdH7EIXoJ9UIOX/xxTBo92P62fLAUf6OSoOmpG7aDeW/6Jc47rX1M8jc4pv
 ws2T2BGysGJOwNaeI+23PZbRlxIH/ho/fW7IenqsvM6JkDr8eP0VBEOb2iQ8VFEY+c781rgMLD2
 MtMR2nRPIe875e8wysBde3dW6AnCOF+gHRmLv3kGFTwA1SAytJ1YokunnZ/baYRx1zYoMDi/rHV
 IJ3DYw3o3Vww78z/1Mor0UfP9HO42V5LuOZyWloE=

The runtime dependency should only be for the fuse3 libraries.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtrace.spec b/dtrace.spec
index d72baf9d..f294e28f 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -53,7 +53,7 @@ Requires:     fuse
 BuildRequires: fuse-devel
 %define maybe_use_fuse2 libfuse2=yes
 %else
-Requires:     fuse3 >= 3.2.0
+Requires:     fuse3-libs >= 3.2.0
 BuildRequires: fuse3-devel >= 3.2.0
 %define maybe_use_fuse2 %{nil}
 %endif
-- 
2.52.0

