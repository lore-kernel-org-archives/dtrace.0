Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79F52F6577
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774921131; cv=fail; b=hso0TyIbSKAcEgE/lnNMYse1R1dsBCc3SWHhLZUNCXsnI36yHmWdAcuzXaAk4meZxFFfa7YzRZ7rH/F3haJbqYdqGkLvEBEfwcyBfaXUy+9AKyHxSj9hbS77tO9W7AIgWK2fB8RODKBCqaGAn4TuigCuKF58BtENvLhmar6tgpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774921131; c=relaxed/simple;
	bh=3e07yRsa6MMQpkkYBTv4p/5KgullyK5U8obXKC4Lmvs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LKe65R8S86u0Y0q1Nzn0/PUdgMqg79P3KSYDAHd0XYnpWGYt9aD4Bgv36PaJwODGEm7qkWWFpP6EImRYcKG0WniwjuiQ9DksENI61WyRw9Ts4QkEkAlqjSBVZpooHiHy5qaErKKNOHCrujfl9JiT2du/R2WY9S5Ac2P3hUD4rek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T793/Va2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OmU1KQ5N; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T793/Va2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OmU1KQ5N"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMOeV73391910
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=FD5SXaEfaKM1GAvTk5
	hjW9qKeKcFCYDJByBfieCFbuI=; b=T793/Va2/AvMIvu0LM5d7mf0l1CddQLsAn
	2kiLaRIuxk9ikbtISUi1+b3J9zykNeHnu8+XIZT2cSvED7ZfTn7NpJANmMK8FFhw
	ppYGYD9mKrf4835kb9U/ESNn6iuy4IufVgNMrTAQOw6U6V04ey1K31oYA6fF+xEs
	QFKknayJXQyErWNWNtXUtiBdSo9OVu42bYIVI5CyXxNl5r/YL5KKa78ntrgOZc1/
	DcbYBKqt/4/Ss1Cy1Y6q6jysxOG1do6rHxskG6Gg+ceFJrhRDoCa4wjAB3mE3BYc
	97EIZEntXMnk4CnXlhIVzuoXwcc/7Z+uqJMnEEnDiMGTzPQPwGIw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d66kqu81h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62V0mFG6029738
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:33 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4d65e995c8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHdXu9wJ7kKILs7zEEQhZVofq6RRepAUbKaVgPqiqB+kZXzcak0WGet+saOYGO58nkLnRxibKgF+4WFbWqmJ1o7xRSJQg4lkuQlzCAkKzvq+tmvy1mvg26zkh0kat7A2Xepm+2v851UEa0x4LKTmCnlyC1u6H6l0ToE2aBmV6ZLxX9uBW/BiGigaRPq2y7+euqrk2YqArNlgaZTotkqxFY6t5G84JOgWEniYkP0xYXTde3bG4eNaX6T03JmgjVdYA1/guPBA29stGzgJFhyMNgV+6Fgjh8SPUbWzK92Rj+ssFv9XPfVfYDluAD/QSWBT8fgrOnu/S9k+44WrarguMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD5SXaEfaKM1GAvTk5hjW9qKeKcFCYDJByBfieCFbuI=;
 b=kJVCAUcRnGAkA1Oh/APr7GMLSFQ2I/3rlSKYovWhBDi7cdaVrE8JwFBNk20weXJvzDKe+e636DWv8qqg0K7bIA4FpEAmeN7+WvCl567Pqlco1CQilFzgGkvf2lL7PynGa5b+0S4SddlFiAbxojw0t0/znKM/ScKHfdGr7wJt0heOPt8NMJktf09GRTmaTEnzc86Lkw34KdqwQW9ExEjQKnWgMPMk4RkVTyXyBeTf0aggVDYvM3YyJx+qEQoCKonucebYrCkd16kEg/4ml2HhxmkESLhUVgdhxlpSAwg3aBasKMrpp0nCnjntrPpjMVcJI7PXOIspUhHYclGBn34xyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FD5SXaEfaKM1GAvTk5hjW9qKeKcFCYDJByBfieCFbuI=;
 b=OmU1KQ5NTAQIMuXwI+aRSE2LUVZOydV9lUpPoygxiMdRdGCuLcEBp5RdP7LK4xYPf7G6Y1fF5kcDK4WGhM2xlLYxcPYmTucqidrR961QBoIzBOiS9Dd+iBYP1Jr3mCmPoaDN1QbLiZecIQOPd8S8WPfIDPPjdRfH6VfzLdfVAio=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6131.namprd10.prod.outlook.com (2603:10b6:510:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:02:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:02:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/6] Simple typo in comment
Date: Mon, 30 Mar 2026 21:02:20 -0400
Message-Id: <20260331010224.16165-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20260331010224.16165-1-eugene.loh@oracle.com>
References: <20260331010224.16165-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:510:f::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9b433e-d0ba-4b74-9050-08de8ec12e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qT+aiiCFdBmq92lxemy3yoAwbrq4hDWcJx+swQdpl+u6fv3U8+YtZ69meKNzaaygtg4nH/qlyb5ZgHfXkT878zVQkJEN+kREVmjf3WPBWTR9KTEU3ZWvd90OCvv/IMJNu7MpogPN8ZvDfUrIccLpUTahvBJ6fudWngVcJuHcq3vi04fyuLL+4yt4Cb9eZHRVPIamWTnWoTgPzIasbVo5CV+obRg72dkHEyl8bDJlUasj1RaEJFpfjBYIRC9XnDQMJZpDmkvBzffgFixBPVs0cTxp3ZAtHn/BZ1G5M/8qwkVRwG60lkTO4Z/x8avHccvZvEIUxvGBj4Ndj/pDpq47mxuu1M8mnL528pdCYOZSaUvwqSWEaCaUEZ3ILeU53ZS2UPKQz2FgF9FKBJrppYHS6Q0fQSA8UDX4BOg89xgchKdT8VceX7ixyV+qBeHWhjLTaHMxaWBMopFws14M9Q8OsVRdDTGf2IsHgl6/3FzpB68Yu+cd2rBF2aQGiYh9y9movyDlGYhXhj2XHlmCggzCcFBFQycjacVYIdJrQkyv3AtogbzbOlfuSjMBARhIScMuatDWMBGO5Kv4FANXfDiTs6pDuLJ9NZcockDiMJt2569md3ohAKCXAtXU8Y15RIPtV/sF+o4/k7t8j3pNs5AOEiBYQRGQZJXmaGiN2xDlpinJ56mn3ldIefczQrsvhaMRCSgVsjOPC8b24XOp4MXMuaWOyWjptliAMPLL3xyO470=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LiQGHkg4lPKVlMgQPO1B+WkJDQ/LGJCnF2TCG+pLs8vIokCBmBIElkZVH4KG?=
 =?us-ascii?Q?0AdgzDYeT0ZruzxExyBfkkGlwVSUUYqhQGEZKthiX/bHiYj/zfXwv8sB9VMr?=
 =?us-ascii?Q?ltJ0fjg/IHkNzsZJhRtnaOBaE5l+DlOQwJCBzXWnu1EKplbKeJnl1fI+JTqR?=
 =?us-ascii?Q?7IrkyrMGryg2EuGFOOiUWi+a2VEbJHQ/ZY1P2UYiaQiuYxmZQ4DHUZlTclPj?=
 =?us-ascii?Q?ptcOkpODe7cW4o2P0yLooDJ2dyXEnsBJwW6l10NqjxlUmylZTbCiWzQF57Nv?=
 =?us-ascii?Q?UlCVW7xIBUfRiW/6X9rbJ9vy1Qq8C2I1ur6g664ODeDuXChD14M7VRvKUtlr?=
 =?us-ascii?Q?bgDkve9pkDrG/Vfcu/4ScoWOO68wbXRGMbQoqMLuMsACLVGN9eZbH6255rag?=
 =?us-ascii?Q?ndMUM2BhSk1+j82K50+RQb0k2Xr9+Jc+QG2NjN8+DAaHVabBjdjDRNtW3kGa?=
 =?us-ascii?Q?eMad84sFpprT2/E3OdX3ekyV4S1y5p1prTRwWs7aUiWD2ssxJBgagPmV2VAm?=
 =?us-ascii?Q?UrB6/8imkUSf6xJoH2cL0i0X4QC7KAjiGFoD2cYkT9pJltU/cnq0GLE6AApO?=
 =?us-ascii?Q?6loFdB2N7MFiVgSp/Vi6koQCSkqgwGFos/9ktl9tJi00uDw50AH/aJAHYeri?=
 =?us-ascii?Q?UDR0EKW15P0a2H/70tO1nT1tamNqXcGZLqm38c96OvsRARMxFDuUTrZg9TBS?=
 =?us-ascii?Q?zsrLfZt+LYpVlDPDZ+zPnfYQ7N86DKADSd9UqdVElh3OeQGvtjW2ODcWs4Qd?=
 =?us-ascii?Q?4YkWKyb/i+nL6gSbHsYoZeXoaLES11edC37z7P6skk1E9QwuK9twnvwwdHq/?=
 =?us-ascii?Q?YWEOBgk75dswlWsZlQEEdVCeNPuc+CzXgqB3PHakfaERaFd5kCHeQpyLIfWc?=
 =?us-ascii?Q?bU0l0iTsJ9JOIOUBesNXbJr47ZTAUEVjsz9X2HeYALz725rYPaQsjj8bQEp8?=
 =?us-ascii?Q?R0s/xyTaKH5LzPtcVAT/p6pnGVroKfNMeU3qsqb+ab4XYcXJACgrswAubzls?=
 =?us-ascii?Q?WUHv05d6EFNgDlOOunHJohdeKc97A/3njH9bGB1Sgbsp8oR4jMNchj7VMdii?=
 =?us-ascii?Q?2lgR8eDnPEDq3cbcay/gOvvuWuhfhFFyj2abWaDnP5Cw61EYBU/4zYB7+Vou?=
 =?us-ascii?Q?9flourY0C60JH7cTQu9+RgmZ53F/EoP2ftsZEDJn1TlPhNmceJI7bhjl+KVx?=
 =?us-ascii?Q?daca6VHFT4sKADXHrgS9WSsdZ0cev6X9QnnqwU4WG01oQCV+ApV1aY2K90rU?=
 =?us-ascii?Q?ICiQ3w68pbHaWFelakr0+vf9HFQepvu0ngRU7bqfgBQvLIhXZc9bUFNvEpkk?=
 =?us-ascii?Q?6fSGuzwpsZrFklBB8YITdE4H2HytspyrJzVtS3BpXAMVo6Q1VZggD1RCrPsT?=
 =?us-ascii?Q?byz0tlnCu77xo/Jjx3azT1p4VOmKiEsVR4qa+ZxZfB4uCWudjwuGxHwLQ1Pl?=
 =?us-ascii?Q?XJX9Be7S7d0p/3K0mGNMvhFkw4dDWh8Xm3omE7bG9VxmApopvK3ytSlX+UW7?=
 =?us-ascii?Q?djBNhLyb+v91VtGBpwDc776ju+rsVn6l5POcwD6Ta9Icy6F+R2+SL25P1Ac5?=
 =?us-ascii?Q?JPwMtSr2wAmyEAcaGxpxF+WJqrCuhFNQGT/ViUp0UFIi55s5KjIMAe79Gk8Q?=
 =?us-ascii?Q?ndr/WVXw8aPxvvxiHZxp9twA681+WJmzPTU9FOHlfc0iY0auvzJ8qi9jUrpz?=
 =?us-ascii?Q?tCvzYRfvJcbB2d4ylN23D/DoY9ADwV1prtWyeYlKca+EqCu0VaThOAac4qH4?=
 =?us-ascii?Q?rggD63J4Og=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	XwcUcWk42/vOgM7I0bpSf1taj6MjNOW0RcI6rYOes3FLDYi/nCzCTGi/+2LlA46HAsfZ7pXKi7D90mNecEq81YJ5/JJ2PWbxYRgkBTY6C3+/t91+3Tqv9hhcLWOoloy4SqsU6ubRT53lTbeMJOFhW6KvBlqQwgQiFrJN+e/QKLnpobpwbmrVRNmJr4KRsggRsukDcKxPhiBLDEu93y2RiOLUmzQ3C38+KJQbkhxuPhiVBL/O76HEzXgweWTHHNL7sHCM4J32ATqZyPU6DmktSZgghwWHFeZlFeYEtFHozGnPNWSmqx96QMU1yadEpS0Jl60hJPa0koIJoIxaiSEV5g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z/oZRyDTinHawhQXm69DhmBp9lxs/Re6X1Sj+9h9q9n2jjOzyGiKQV0of3NYqcvLEackdl8k+vZ/AhRhquLrODzMehvy/KoQAxDvyeY7m0DYPooM9rgqZk8kUlHd4gsuSWPVBa5RWDFaZkVhqkDZaASI2K+4X1cqLuFsx0j9YY2TtLqA4+3/QHNl0ZqgOm2KUQ5sGujbUPNFFJ7USg4rRuBilfhWqI2lTpM1OKDf70Vs2HV7G9n0oX2Y3TB+emcMUtonRtL8Tco7GTIuk58BUJx8B6RXkI+fKp1oc8d1ZLaw1q4rpdtWnR/mn956deVzY9H9J9dXdr0E8FYaBiaaPoxLcCcRF1h2N63JYLWDu2hPTL8FKCiPOi+4rnQyfDdVLHRklL+6AmHhgkVAjnovDtt3o8upJ1ME9p2Ai4SmCjbEs7j27/xfERc8QI4LwXUGUGRWU4+2PWcKk3miSSgE0msrwuvoZMDHaNuxb7mGQPVnwT8wir/N3tU//r/Uuwh42UGfzqWTttMLaWK0XIu0G7Qrlp+XD8gJCwHISjBphzazQZv2ihNAOpfv0+Oxuhwas2EbJhZUotNQLiQo1zX/sB8othciucDhOGm8cT9YwKU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9b433e-d0ba-4b74-9050-08de8ec12e3e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 01:02:29.0602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPvMe7OGvu4f4uyFS7VB5z/fuZHgC9HJzyRwDDWtbplho9bZm3f7kkFGpKQR6TtBvYys7QmD7OTyQ4lIGMRG8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603310007
X-Authority-Analysis: v=2.4 cv=PqaergM3 c=1 sm=1 tr=0 ts=69cb1d2a cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=26Sn6DwbkJ2VNwVrCaUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwNyBTYWx0ZWRfXzLHa+XkUIG8i
 vlZpwZHlYtJWtL7lDeZ/Y/AScpt8jtKOh6T4n+XZMgIEdvgnyZCZEtOrn7A+2755kDwAggvmAWx
 jGoFqprgWSOSAIzXGI+8aaiANqnw3SDzkiyefrmsv8wvuyGJ5wmXt2DSEwNSGUdgQxK5pttUUXu
 k1OWkQP6yd6hf8wgaGxqy6XHteR9g7i3oTQG0qM3ggnFy5v2ev4YvITn4W529St9+DmRtdBilm8
 laFVsiWMT1IjBIyUBwSCzXDx1xq9Fc1IpEbx4aCehxIhkH0wa05o3ccI046dqLN3WMu8HgjU1//
 stklpv0fC4K0+Xmfshv/0USwjRlWSTDHgrPsBWNU51Nr15BpqmY9TOicige7kqcrwbevyNofTrt
 E+ep9jTeRoNIy0+IVILeW8BP9HvdGxXOIKGRhy01ijKv7Yjjo+z+NAxRvPIl77iNw2FB66IZVvO
 6nfJ0Bia1zkMAMFCa2w==
X-Proofpoint-ORIG-GUID: Umzp0v6QbYySLoYKX6xH24eoCl46UhCk
X-Proofpoint-GUID: Umzp0v6QbYySLoYKX6xH24eoCl46UhCk

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_probe.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
index 54053cd3d..73b15553a 100644
--- a/libdtrace/dt_probe.h
+++ b/libdtrace/dt_probe.h
@@ -33,7 +33,7 @@ typedef struct dt_probe_instance {
 typedef struct dt_probe {
 	dt_list_t list;			/* prev/next in enablings chain */
 	dt_list_t stmts;		/* stmts */
-	dt_list_t dependents;		/* dependenct probes to attach */
+	dt_list_t dependents;		/* dependent probes to attach */
 	const dtrace_probedesc_t *desc;	/* probe description (id, name) */
 	dt_provider_t *prov;		/* pointer to containing provider */
 	struct dt_hentry he_prv;	/* provider name htab links */
-- 
2.47.3

