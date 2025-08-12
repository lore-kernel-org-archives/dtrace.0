Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339B51D6AA
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002503; cv=fail; b=T96Ehd3xXZCmWvFAFw3sXQ93wojvH+OdHd+b1K/+eo5/VwKUO1br8JNWA6sqgP4zX2B0JLmbL6Ld2DUCvfR9RjF4J2iLBXewSiNQIRpoUxA7axYHunKDi83C0F2XxgDxOA6DYky+iZKmcG7JCnszoDDDU3ZNJF5eMWstkOH72Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002503; c=relaxed/simple;
	bh=KvOkrtjzQsDLyEOA8Tz8AXnBOBjD/Pgt5RLLJBFW90k=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=iKx4QDZBGpAOGM6qykH7nrG5DroybCJyWRkj/oEg0n9w2zdsRti6cwnhoyGhhQ752TGtO70YS688+tx/ilEkyWyAtdDzda8aDYYKkYwwwb2d6rX7heDuCyR/iYU8Mdiu5WFEo9LwWb5DYmyKdOJYVa9mKAlizUrXfWfaStyvBuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a51FxjZN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=C0GIvjUM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a51FxjZN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C0GIvjUM"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C7bbFL026977
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 12:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=RHvJI63p3HGgadqHoBppVzxVQQmC9ZUhr/ZqHtDe9gE=; b=
	a51FxjZNjGYGKRVTWxN73oO5V63lHXqiT9kjH+htcKyxfMvWsfzDcNOtU5b7CzQP
	gLbwdpG4YeMePKVzBzJGI1hR4UvauFCcYjetBHzxpJ6aNWaXIYZMgIhM8IClZT1g
	5lDvaM67fheiZ9NDXLu/95tE6djvDVtkTNJGHeD2AyeRgEp6i+ALjw8G+ydTz3T+
	fsyoPRp3ibXoFW74A1L+rzFri/oyyIkysvJID5gOFAG4Gkq4d/joX+3wLrkuP2UM
	cawfh+xAABDW/zGcb7x5Kg3OfgBtCT3OAJn7SYyb0qfVcxVXDgKBB5g/Hx1V14Ny
	tWKZTEZ242Rdbis+RGJl/g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcf4nf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 12:41:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCB2Y0030129
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 12:41:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvs9wqt9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 12:41:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJa2DBfWxwlj16yyMsQJ/NHVJ3evuVx7sfJlJxHFg773gxvmWHWHRGlurdVxqumg8tCKd9oMtNE+c2DuSAucNNPuQb6wK0vZrIQJfcbfgBumsPRXzRUZ0AITyaX9qVxoDYtN5v+Eihw8bM5s+xPvrSJyZ7S7ApKcoBHeyympLUBazuXFG5aosfU9zuSlD/TRu3/z8SsaSmRh+lKRd3d1Z2qWvJOpCWkNh2q2ASRzryc1lYY087wVUcp3Z9Nl7yRGiXvlyMafLnYJHbJBgY82xomOrxoOjvFHcJuVegI3eBI2Si5F8D5XYeIB36L3cXQCj4wmslO5skMmzJFPFDPBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHvJI63p3HGgadqHoBppVzxVQQmC9ZUhr/ZqHtDe9gE=;
 b=EBMIkAGVycnc23faJLeczfpcOiyI6zrjDVhoGtD1R5I738of0gjG5ANfv2s078YWwrqnbJQhp9cT3VCBZDWHka+2WoNHKgBDvMKyqoB4Ldes4vw01PzsHhy5tCAP/CYbjwpZRNQVtfW35HSWCxqUjeQh8RKH3Ok2GvSTTifiqEuuJH+ZFcgVbypjKIhwADUEg/aO8rG7Sztc3VFshwd70ZvopyPAjTRmrrEHfSzSxYHpVydwxXfXSFK98lwQ5O2PLm+Y8/utEvwacIdskqMSn6g3ThVz9lKUvpcUzjaB+UYFbTm/IQjbdzVw8hWiAsv7qpm8ARMZ1z1u1W+OcrJzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHvJI63p3HGgadqHoBppVzxVQQmC9ZUhr/ZqHtDe9gE=;
 b=C0GIvjUMu/Z/W2ew1aTesP6E31zPAwLgRujc51pux70/pyzuDA/B6LcDEXk00Y/MGSidODifA0elsHR1FMTab+y/Xff4xF6VAqRvtjb7+eUbrm6IH6DiYNRFB1amhmBA4asqUTdIqWuW7SuiDzOKHSgllN5HRioHSWh9nYxWyF4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB4637.namprd10.prod.outlook.com (2603:10b6:a03:2d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 12:41:37 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 12:41:37 +0000
Date: Tue, 12 Aug 2025 08:41:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: adjust sdt.tst.args.d for task_rename tracepoint
 differences
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672305D781B114488EA0800C22BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8e56cf-69df-472d-3c17-08ddd99d93b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sNqIhDkKnt4GCWPXkr8DPAF2mAGne+vavoG3X3wH3HHgXefBM1ohy/RfV3Oy?=
 =?us-ascii?Q?SSfeNaqG7rJaV10oAh2mCsUN9W9O+WvvYOAYxaMD90AsO1UVG67vXVYcdZqR?=
 =?us-ascii?Q?DDloBv++Nquu+2Pi5WnHRqKNb2NylgYFttY/6pXwxOR7lr7SGKjRWOdeBUEW?=
 =?us-ascii?Q?Kq2WUqRdFgc4cVxAmugcnC0Sa5cp93BDCmZsKFylKtG3ShiDxWh1NmuHDxz9?=
 =?us-ascii?Q?sYPAy8IkmwiSxf+5mO59fRBbMh+9YsP1uOabmat8El/uzLj4u5cP5Cw0DIA2?=
 =?us-ascii?Q?UM+RZ7XtGC8ZhqsxjMy91EaUWIsbWkZUESe1RgF+lW0+pBgZ6bcoBtiLvrNW?=
 =?us-ascii?Q?RRePlbq/KjY9Qv2RprssqeGA0JVAimeIfJTvbsF84dJkiQoH2oGsNH2m6gT+?=
 =?us-ascii?Q?ZxdqDFG8rlLJQ72DGbhFgMxcPfcSHf6WBl3cFv+wo4sWTNQBWiOZogDnkTmZ?=
 =?us-ascii?Q?+fwT8MMengj17bC4cGQhNTKrKRjYp+bEG4AOtQCCFmww98noBRfTL0ah6mzL?=
 =?us-ascii?Q?GgQ1H/sWLydYtlD+XpcBdG+Y87nKURoYwha4qzmU9E8XXPf43wIjrMQ+7B9q?=
 =?us-ascii?Q?lYPPmZnK4YE2yorCfOXgFY5K7DcNUGQmfkkx4FdeFVm2BBbMGupakT3EiV3F?=
 =?us-ascii?Q?xkhvsqx27nNGROlu0Kha1rHECj5CXO2DEq7Jp8tsEcQ3dlHAkM8UnogeIn5n?=
 =?us-ascii?Q?N4/S5JmDrLCnXhgyvHqbt/E/GlQBMtO0OFGHsCCvj22LIpP+DWVrfrBBcg9r?=
 =?us-ascii?Q?w7AuZWziPEyffl6ryDVvDmbuAv8x5pt4kUCWFrlMAoZiAlqbrRqsSQJSfaXu?=
 =?us-ascii?Q?oHTfIxkTZWwPw592kxjl349J6bJSiBpH/kaYQla0j2B12sJGIrjLUZaFxoQW?=
 =?us-ascii?Q?/NbS3GthWyHI1uFEIIwhnGlq5XoSYSLu66SKfTneQfr5KoJbWtqXOA+a59D0?=
 =?us-ascii?Q?teYahgU68Yk7MMmkzjrA/apmGyQ3Gaz+xHi4JJD7mFwIOM6SNkxnF69mCmqp?=
 =?us-ascii?Q?VCprRVk+pJAPkTSHDKMFaVS69nSubQgOH/Cj6Jb8sWWVmbfonEqvZRVkJviX?=
 =?us-ascii?Q?enLfSxDoSFaV1pk8rudjrfIuzGfbEYRxJpjSsSMvQEohT/x18GILYCsRhqNL?=
 =?us-ascii?Q?muXtfb7lw1psz++vx7IycClAzDLMS1neR9wV8H65rEPmL+HzUEb5avZK/mma?=
 =?us-ascii?Q?AQOYAtj2alWSl5LDz+FrYpKrWkZa084s+xwOBBf44xdOgljKfz0lte63OmXm?=
 =?us-ascii?Q?Q6bfiwKL/47ZYXU2JrhkRD8fOmaWUH4lIIE4KkBXeNLBxhhkhlunDaRzUOez?=
 =?us-ascii?Q?iRzyZYQzIqhJ8yPUiekmbcZVMeBl0/8rugnR5JyaK4J3mO33rLnocnfo1hDZ?=
 =?us-ascii?Q?r4uARyDKoiiijX6Sd3/R1jDVpMaIPpFY/iuILh0yRbciYhEzfoNw7xhEmi/f?=
 =?us-ascii?Q?Ng4u9nLnKO8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c8i8VPqaQEMfB2WgN7YL+319SgdBvJ+BJYJg6C+zfIXRm6wKfS/aF4GdPQuU?=
 =?us-ascii?Q?sNuun4Pawdcre3va8cEcAyaOTJErQIyMfCLB6Xf1QhrlVRvn0jG6Y+opVrqp?=
 =?us-ascii?Q?b++65wK3qJv1gj9TIvsV0vbwYgiP8Z6eU6MrlxfLv/yxwtnhMBSUMx3ueHQF?=
 =?us-ascii?Q?Z+olG7gsl7IkvztwLtR/vhAgagW4LKL2l7EVnOn9Yg7jgStAlPD9lgf6vMU7?=
 =?us-ascii?Q?jLGv1h+nVZoUHud3jWIntqTVQN+pTl/Xo/vG6hSBtkp/aiGf5wfGDm80GDmJ?=
 =?us-ascii?Q?/pTxgCGP/t8rEZTX4nCfMiqrn5wuXZQlkTqrtbwwPPpIf41p54QW2444E1B0?=
 =?us-ascii?Q?aG5lYW9bR/H8yq8I4rBxQbgoY4YuHEotXKd6V/lxE1dVXezMDqF1vv/QAy/j?=
 =?us-ascii?Q?BDFHQobdSErF4fhZKm2YaAy/nn8QWeseHPWXFaf7Y+Z1tpQa7v21gkSghbwg?=
 =?us-ascii?Q?dC9r338fLNcujOPK5gbScEUGd728T40YIzFqL1BpoGQq6ntajKriwcCCYWS0?=
 =?us-ascii?Q?pKbtENDvVJZrMFSeEaM6qouFtQngSKpclik8Uv/73tNtJe2J4aDnWqpD3BEl?=
 =?us-ascii?Q?SSPCvlTJNQhB3D3M/ElHOnVwPDDFkbOtxHxPVgqMqbYw3LJD0/JSB4Jt97DQ?=
 =?us-ascii?Q?URz3GB7NQlDUqUmNuborsW3AkcNVwiGTjzuAHkwQZcTSpADtcN5AzzqCXsTP?=
 =?us-ascii?Q?htWrdNKtdsDyIUt36JubwfXbhKIntokUNyh9uQAf2K7tHLto5CMd+wgkXebW?=
 =?us-ascii?Q?17brtE30g7dHNYzQCHpjoPVwolxgfg8bZXQUHrIh+KNeO42NFo9WlOfWSvQK?=
 =?us-ascii?Q?vxabuokv5qiICJOy0WKUk3UQ7x8ZUqr3HI2NhCVbm6yCdzVxC6lh1JAJ62Cq?=
 =?us-ascii?Q?nondI2OY4QvcyHyJstxwHhTx6f0VU+YLyE+KhkQtVgGdQqFs2dK6tJCDPuvY?=
 =?us-ascii?Q?BGFhg5o0+fwlgHd3TbSE9Il0etLBuJ0OLzuBp926Xg1LJ7Z4ZVcnofx4IKnD?=
 =?us-ascii?Q?Al6ODRTz11URCngQnabI7z8vfVAz9iMtyeoKH4QP1AuJWE7uKITpjxO+twmK?=
 =?us-ascii?Q?VPgvK6vIH1Ho8YI1o2TnSHu3mzhQxtUbOiOHHnjP0sTSK9jb/RB7qP1TEd1m?=
 =?us-ascii?Q?Ux4PMLT4/+KjaaisJYSLeDN4leQ/QMIkSrIYCMpv7EInHkMDUXKPyCeoCgnl?=
 =?us-ascii?Q?jd4rpPnquqeoXZ8QuRS4Hg0a4KbTsmy9Xtfgna7omp5qfYcQ1JI+2XD8EOod?=
 =?us-ascii?Q?2japApxghU/TuSn4DkV68b6RBptNvro3diNAHiMBNWXOKH6VFEyvf+eJ/R/R?=
 =?us-ascii?Q?t0MNLa/F1oOrC1EJjowhQLissiXnzNt5IerNMHyNXdklbTOWbdfbhWRSwG69?=
 =?us-ascii?Q?bVCwT1Sa/i6mb08VlEr1Gi8qDVoHQfm/AZwgCWWG+KDU75Ke5U1U/rhd0oA0?=
 =?us-ascii?Q?jFYKJUDDPbhFAXT83lkIg30GUoXW6kZNATu00IFYZN3HGdrNRoN1MM9Zw7Sc?=
 =?us-ascii?Q?JOlA3VMG/mv5Lg+aIbDvDBNKp5QRDIASmiZgn2SN8WvTNUWXCiFmsKNxW9cM?=
 =?us-ascii?Q?+J9T9VZT0AaPtgvcWQ7+4CZvd5ozP7AK6VTr1V1w8kRA0fJPKm1yXxCvaQ11?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3m0wK5JilAQ0ZtBVI5hetEYi5IloYrqM+Mteoiaro7q0kfghrilBF45hrQ5+WwFoTF/brAaSMwm03aDJJW6Bv/6Fb+ejT7ffS1o5qX8WJ1ZPe7PgPbvxpoq6GVdtkbwHtbkjt+YmxyQZPIf5w4qvj9EwHB3273xQuO7mUDx3a2ngytXpQHNTuboaoJVWT0c0EUO/pG0C54t3z/605ULpTmg8P/mzJxg3H8nKz5RJnGrfdDWq6BJ6oi7VdFvx4Q5s/NnJcCJssRldfRYyAuSl95ZhNlJiBLqe+mz86i8/M3vkbkVie4HL1MFKnm9JBsuXczpE62N4C/xkMhcDVwCud2xcU7tnuI3bofi0lDpHgzE+sqh0Fo6imGzui+F5wLjaP1/sABveR+LDGBe+8rQwZhnX0O7LpbaCal2Fg/MIGKu8fKsmj6ebHZikyZJo1cA4aLV8JcLL/yof7/G7l1XzAu6pimWFaWO2ug6mPEqvbEkDmVLP7hsn0dmrH/GZmdMgtConKL2CE20f9ClbXUD/6kgjmF/5GhHfJuxU6eq8ffZXs/VMEMqN5iQLx90HkfZfABlNVFGzoZLlpnrCp5FjQ6BFHaTL4hqufScq+eMXmsM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8e56cf-69df-472d-3c17-08ddd99d93b6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 12:41:37.0941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQQBQdtcTRAOCyrx89JkKdCE8ijAaG+zRfM0sd+QPc2uhVzfpeiZGWw0H79PcdQlYXZwc6ZOBIJMn3xXkBAexmWImnVDykM5A9HIYeijZBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508120122
X-Proofpoint-GUID: qrEGLXZDy1rnFmdI2WVjwekzQtz0M2Ow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDEyMiBTYWx0ZWRfX0FAKvokRo/y+
 v4i/DBtqQ9EnrxRcg0jXw1y11aGw/RVoDtnMt4zKN9QqQ3BUHL+J7on/jV7qi1gAiLqxzBWOVHj
 e+YSaog0C/Vowoqah1kX/I8Ekhqn7+SKGhrzu4y59RgtbigX2BNhjyeF25DJpa4hxQ8BEK02zc2
 JU9MzbXJFhN3plro/Twt1UMFKqoua1Djke3LtKAWwAUSIfJ3Ff7WlrAbKq9LKmIUEm+tPrX5mZj
 +wW2V/WHxORaUkm2Ih3Lg3NJM3S8Eg5oKtKTs3uk3xSExcyqfSttP3YH42kr/kA8kELpJDaLOlt
 M2eqb2gugawm93uSCBRgZNp3B5E6EXEaWE4ABqPISoVMf+WFAx9cRi6hOKk+7OlvADi0VGZQu/Z
 +P1N9wzwgYKhMpmlb15fr/x6i1ZR/Q50dIhM6kQmQ5GMWMh3lJ8aUJq0iwgd4e41sSfuklg/
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689b3684 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9
X-Proofpoint-ORIG-GUID: qrEGLXZDy1rnFmdI2WVjwekzQtz0M2Ow

As of kernel 6.14, the task_rename tracepoint provides only 3 arguments
rather than 4 (the pid got dropped).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/sdt/tst.args-3.d                | 42 +++++++++++++++++++
 .../unittest/sdt/{tst.args.r => tst.args-3.r} |  0
 test/unittest/sdt/tst.args-3.x                | 14 +++++++
 .../unittest/sdt/{tst.args.d => tst.args-4.d} |  0
 test/unittest/sdt/tst.args-4.r                |  2 +
 test/unittest/sdt/tst.args-4.x                | 13 ++++++
 6 files changed, 71 insertions(+)
 create mode 100644 test/unittest/sdt/tst.args-3.d
 rename test/unittest/sdt/{tst.args.r => tst.args-3.r} (100%)
 create mode 100755 test/unittest/sdt/tst.args-3.x
 rename test/unittest/sdt/{tst.args.d => tst.args-4.d} (100%)
 create mode 100644 test/unittest/sdt/tst.args-4.r
 create mode 100755 test/unittest/sdt/tst.args-4.x

diff --git a/test/unittest/sdt/tst.args-3.d b/test/unittest/sdt/tst.args-3.d
new file mode 100644
index 000000000..ae070cb72
--- /dev/null
+++ b/test/unittest/sdt/tst.args-3.d
@@ -0,0 +1,42 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option destructive
+#pragma D option quiet
+
+/*
+ * Ensure that arguments to SDT probes can be retrieved correctly.
+ */
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+	system("ls >/dev/null");
+}
+
+/*
+ * The 'task_rename' tracepoint passes the following arguments:
+ *
+ *	char	oldcomm[16]
+ *	char	newcomm[16]
+ *	short	oom_score_adj
+ */
+this char v;
+this bool done;
+
+sdt:task::task_rename
+{
+	printf("PID OK, oldcomm [%s], newcomm [%s], oom_score_adj %hd\n", stringof(args[0]), stringof(args[1]), args[2]);
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/sdt/tst.args.r b/test/unittest/sdt/tst.args-3.r
similarity index 100%
rename from test/unittest/sdt/tst.args.r
rename to test/unittest/sdt/tst.args-3.r
diff --git a/test/unittest/sdt/tst.args-3.x b/test/unittest/sdt/tst.args-3.x
new file mode 100755
index 000000000..80c135543
--- /dev/null
+++ b/test/unittest/sdt/tst.args-3.x
@@ -0,0 +1,14 @@
+#!/bin/bash
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -lt 6 ]; then
+	echo "tst.args-3.d disabled on kernels < 6.14"
+	exit 2
+fi
+if [ $MAJOR -eq 6 -a $MINOR -lt 14 ]; then
+	echo "tst.args-3.d disabled on kernels < 6.14"
+	exit 2
+fi
+
+exit 0
diff --git a/test/unittest/sdt/tst.args.d b/test/unittest/sdt/tst.args-4.d
similarity index 100%
rename from test/unittest/sdt/tst.args.d
rename to test/unittest/sdt/tst.args-4.d
diff --git a/test/unittest/sdt/tst.args-4.r b/test/unittest/sdt/tst.args-4.r
new file mode 100644
index 000000000..52854c0b3
--- /dev/null
+++ b/test/unittest/sdt/tst.args-4.r
@@ -0,0 +1,2 @@
+PID OK, oldcomm [dtrace], newcomm [sh], oom_score_adj 0
+
diff --git a/test/unittest/sdt/tst.args-4.x b/test/unittest/sdt/tst.args-4.x
new file mode 100755
index 000000000..74a0234bf
--- /dev/null
+++ b/test/unittest/sdt/tst.args-4.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -lt 6 ]; then
+	exit 0
+fi
+if [ $MAJOR -eq 6 -a $MINOR -lt 14 ]; then
+	exit 0
+fi
+
+echo "tst.args-4.d disabled on kernels < 6.14"
+exit 2
-- 
2.45.2

