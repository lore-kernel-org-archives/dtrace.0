Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7482221DAD
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768574928; cv=fail; b=KK3HvK7IFjqie2O8UAmCUl7X1muoIbW/eX4BlS38nicGxctVFYy1Uxmjk2X3nZOtMqMpmyP+lniKueWe5YYqPxxcYPpalMA91cqubfUCJMkxAaC1vVTclaaDOxlEd31yVjebq9l/kFCFKF+UNEHoPZwrTB4nXgQKdLvaZUEtrhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768574928; c=relaxed/simple;
	bh=73xh/Hodv0oSJYfjhe9N4XscOtbEWf1DKki3itE0UB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CWYZSfCaLP0m4fr+ThIuW7FBKzRXMaeQGoHwx5V0XBI/TqrMoExneFP1qfiwTuZDJZAfcIBiH6ePhMp1JHzgYa8WivMsS6z62Ln98a04e5QEgXa3CM/l9JEgvJh+GhgXyZ1ZG8ivaDXcCghHBDuRdBtIi5O6pswbnUKs8WDAfTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P4muM7sK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ReCfBf3w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P4muM7sK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ReCfBf3w"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GEb3Be1817896
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 14:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DPMT1Z/4e2tnnZAKy1
	fN44Sb3LpuxqUyyUWWl+w07gA=; b=P4muM7sK418K8GRRmXBCLKfbpjAHDgDqpi
	LAneIaysw94Sj/se8w7DismNvSEnSicSjKLdCtpAHikr7rJav4wfn5hWRzhgdCaZ
	lh6P4ff6/Bp6oLyBzuHdnPnO3OvK+HlZAyF5BJ65SVWVU2qXSvQ7aDH1sPuy06bw
	URZ6kGEMl2DQBXl/U7rPM9SSDmyOrfraBkizG7BmRwokh6QdY5dmNVk0raJiP0q/
	9UwV/tmAopM+sJMKj23X4ofIGSoeGw5hPRhNTF7Fyt2AATODPgkcoa8b9fJOtH7Q
	dNYsiZd5sRNAZNCoSUz2WsKx3ibD01kHL6dFwZvT9bUKTaggIP6A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5vp58kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 14:48:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GEhvxE004325
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 14:48:45 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7ps4sq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 14:48:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLjaRGwC4VAtrfn17DlKK94+3ZdfBu1wRxYYR6jxWbN0OfEaHOGYTv1UR1IOAbWtchgGSDO20EnXC0eRlk6ACTcCnim3Aav6Jtt49s6kzaXPxNThueJ1uyAUCeeSK/Tg+B+KuFoFGe019d4y89yh7u4cmMvEvGRsazngetwxYbAYaV53QNHMs7Tyn4sQ4e4KfRTcaznF9F9sqzqLtaxjaZP2KrY6ni2IaormSTzFWfpxXmkk2+6fkTdMGhXouYUkuQkoN57NHaun/eowuiLx5Ci9mzKwKuV8FfqpK6sRVhjZf1lqb4fXOn0CYAPmUr1oTxT0MC+XmEqH1dMyIdnhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPMT1Z/4e2tnnZAKy1fN44Sb3LpuxqUyyUWWl+w07gA=;
 b=MvhmkBiQJ2NrkEeWKoIt48+hFtwu4Yd4RtnPZ3x1hNMxgFTR2y8zzvx27p1gBODtrWosWvPRhNzaRfi0VtoWTXcNDRX6PZ38HDTqLk6fMJRAv1nC1nBTdiWE4WDDDta7O1PzjeTnvlecHfhFOyqtOx8yhochtIHC7WOUd8+wwxUrMeDg0vmGJ5PJdwbBlU1SfcCBuv/jwNym29BgsQGgVTwsgeWQchfeXHj1XXVzTtdFDKESemuzTzVb79lbynFCrUbx/qlRRX54uFvtb1nmXwrvkxYZRPN9Wd6YhH5ORTXVJrUU+9+MIAxieBthGFC/+H+JcSfm5Bwabl4fEZDkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPMT1Z/4e2tnnZAKy1fN44Sb3LpuxqUyyUWWl+w07gA=;
 b=ReCfBf3wjcRbQOMOujMxEk74nqQWnKP6nAnm664ULutA3CC6sPHc5efoSfE/UMW6cMTPHSlaJ3IsU1PAg1f4sV5Ex2N6dLaViIx2cCdWOEJsO/ETYEffTrtaMpwF75WQaDY3JH0Fg41VwZiyOOsJ24xpgXQldS2V0agPCWrqj24=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by MN6PR10MB8117.namprd10.prod.outlook.com (2603:10b6:208:4f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 16 Jan
 2026 14:48:40 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 14:48:40 +0000
Date: Fri, 16 Jan 2026 09:48:38 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 0/9] stapsdt provider: simple system-wide probing
Message-ID: <aWpPxsFlQgZ9M49f@kvh-deb-bpf.us.oracle.com>
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113165132.2454591-1-alan.maguire@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|MN6PR10MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 05de087f-a53a-41fb-da60-08de550e5664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oq4gIpp+mo+8y3f9kZRYuF+N8xdf/DnjkDf+iHPKa2P7MbgIkc3KUWm/iOWj?=
 =?us-ascii?Q?bFYskVsESpGAfmahYWV5fg9Mwsq8WnLmLdqXwJp8tOtirNZpdZKWZNY8lE8a?=
 =?us-ascii?Q?Rgo4Q8+WLfJ9s5fKwqurAA3LrE33yRASknXHnGdcjfE2FgtXbYws8ux5JRtK?=
 =?us-ascii?Q?3kQP+H/Edgor6a9gCTlRubfeb90H2NAh4pstsNEwcuVOWuX0EOCdRuR8JTR9?=
 =?us-ascii?Q?I9fOGg4cw0s2Op8v7ObLq6tO71gyAq5Du7w9389LCp3kN/iJaMolrMa0f5SB?=
 =?us-ascii?Q?SZaiSNCbjOYhvc4iHglPt0CagJrLskoBe/rF9hGF+h/PlexB4VJy3kqmsKSD?=
 =?us-ascii?Q?W6D+nVmjLAFZoU0d4lf6cdynIC5AcE22SQWRb2g5P5XxHePh7gQsa5d61mAo?=
 =?us-ascii?Q?rKro69fxR/7CNC8WazvKj3tgovwIjX0fpECdrITuPtp8QJKhfgHVF5D6ruk3?=
 =?us-ascii?Q?LJG8SPmANpsyYER+uEIMw/n1L7ROmdgnHNek0SPkGQCt7k43tfF8O3r63ve+?=
 =?us-ascii?Q?KrptPCpeOSZnaqs9dVjU3qC4rn1JWL3ys2qYDwgRK8nMd9P4+/SBT8YK5W4P?=
 =?us-ascii?Q?8j5q4eLMK9AGbkHkIJ78AxOGZvOGbIMXuZ/NWkJjkJ3l+VubDDS1vv+VVemQ?=
 =?us-ascii?Q?1fzT1/kxu+OwfLUefNarTHn9ppxo20vQIOd6PPTAUIIC9irSc2C8G4eagdRU?=
 =?us-ascii?Q?I7iNqiG6ZnxPKQ2XmpRY7/u2fTfxhQTpd2h8tFROvgeb0+UhyXpaeym4EuAz?=
 =?us-ascii?Q?xjbxa8qs5M+oUohPETcIKxsqc/3lAqW4XIaMIy5WI7e0ALFcPp1kpdFtPj30?=
 =?us-ascii?Q?iOkto3JGnF9uqQ8CfCw2PAD4CXRows1Q4CTjXELa6sA4K3J1yhXXn7t/PN2C?=
 =?us-ascii?Q?FwzM07HRmrb383NiZdlJCR76uRGCOtGCqIRkl77rSQwtYsfpZG6ApO4+zEV8?=
 =?us-ascii?Q?Elo8P8hUxh/MkCDj2CrXFyjKlZzC/OnU01oek6QAEkWk6Cz/9X5xk+FvZ1O1?=
 =?us-ascii?Q?geJgxqJVYDWj1OMarZscfGwgTM/ya/zfqC/lQqHxz0+yyBd1VADGxUtUjkjE?=
 =?us-ascii?Q?js4TFxJ3z818OJzRjvNudObfP1RYLLuuEsrY4cqoIQXH4vzqbmX0L8ItMxMb?=
 =?us-ascii?Q?Ygkm1wHBf1Osr574y/Kq7VGSZ2F5o6v81qkspq8DMgiz3aniUQ+q5RnEDlBQ?=
 =?us-ascii?Q?CgAAdYluf7AE5S7K/hOXzFr6Pmqjp+uoks2fTiQxTK6FTZoRwVNUVmdJLit/?=
 =?us-ascii?Q?mJtVUWi+/1omhrpIQqqrdSlGfrR09tsS8bNDheFyhhAb8lZISKcP1JhDh7lx?=
 =?us-ascii?Q?7XYC6GGJKNzXd/r3wGQ7KXJ8zf25uPCIKbv2jnoBcYjJ3q/mCesPKUpUtK3p?=
 =?us-ascii?Q?pNrJhEeT9YySPtjnHxtZRBnOLkHRMPh98/rrKbIpCnuDaWJ1JVsQ1Gx7qVwG?=
 =?us-ascii?Q?wk4OJCHT32fK5LDS80dKAnrlsC2m0FHhbG9fe2xtJ5MBYgHKGnlulmW2y8am?=
 =?us-ascii?Q?omMXvwc4/UjbNVLKy9TnR1VuQv63ZM+NXDIEgom1UBkAAKQAIEf1TnV5I9VP?=
 =?us-ascii?Q?D3mwYj0Qr79TtPm69rE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N/TBn3aoulk7QIq8lYcBLKRXyq2ZOv52fZ/TNI1PjtKBirqgAdBhUm5hL3Jw?=
 =?us-ascii?Q?C5brglgBJENX09Ql6bACkZl5R0qgIqYYcigmSal50vFfn85SlXzGDND+FX9B?=
 =?us-ascii?Q?5BbbQSXmMayHAx6kn2wo7CqIggKzYfP+vkZqTK8In+0A4Y/t0CS+sugAfe3n?=
 =?us-ascii?Q?YgEhPItoIEm9lsq5mLOVli1r135oTJXU/+oe21DiKpIJ563dm0WvQjNSJsyC?=
 =?us-ascii?Q?5aeUUw5dWEufRpZP2XPvCvq4xWODo0IyqJpicYVpG6WuAz6Y2ezxS9g6J3hA?=
 =?us-ascii?Q?tamofEeYC4bLfm3EUcCIPPOjWGXK98WvycyBsSZ4acnBH+ERQ/UWdBwkwwL0?=
 =?us-ascii?Q?6c4VRtw/tdJ2LUf97vvvhM4BHR7IckEj7clF9shDZ6O4Y/nG82WnYUHukGVS?=
 =?us-ascii?Q?nr55hWsHi9T721FD8oObuR6cH+PzVLwx9wEeSANgpjjPIBffsM/+1rDOK8fP?=
 =?us-ascii?Q?4ktQn4qd9VScezuM2XarTI+V8K++feFS+VgVFSsFV5gCnzLenj2Ldc5pEZQ+?=
 =?us-ascii?Q?UiJGi8MTQO9LcxLUmc8SYHWDMY3Ed6Oz6RbSk512Vpj8aQXIOl+lfLpc94/S?=
 =?us-ascii?Q?Vn7zX/fofqPQxhAmVtdGRNuwsIXLxr+yCS0GiS9L1I9FGUXiKcYRgrJQitzv?=
 =?us-ascii?Q?JoG/GBfPQ8lNmYsRMJ8paOCpmpwB+om75pERdffSVi7MLLbO34wAP83ik+kN?=
 =?us-ascii?Q?xoJFRy0TAndM92Lkw7SQ7WWAKD3lNw6g9/pDRDuXZop/0Q+AzJqlGsAHt2yW?=
 =?us-ascii?Q?X1LSEvaCltalnN0jp8I88xj907F7XPXgpK5DY743hTW2cOvmjD6KIH5LaGDl?=
 =?us-ascii?Q?mdqOD2Zr/+jEVaE2ZoO0F6fvpqCM6R2biW2x9v6ogZqmMwwQJAODvI2Iqrof?=
 =?us-ascii?Q?qNhGbSXhq9Zo+HBBCqzKfLVYHBWFulMScZIuOK5Ya5u7HDj+T6db3XfoX88V?=
 =?us-ascii?Q?EQeI0ZnLaAjdhxeyt2xGdJCKl/GBJpjw7sIA24cwUFtXa76XeQeaHeUrX0NE?=
 =?us-ascii?Q?hk8V2w5QbCtt8ADUzhxqs21JTyhmfgDLOusfzgo8GfirHN8dKPgCCdUq1yVx?=
 =?us-ascii?Q?605cZnltkpzO8CFGg98DhDkg9mKFwhKoUdMF3Xf6xHEu07//mJaXuvABW05L?=
 =?us-ascii?Q?iHRcImMoFj+VJhpGtpSlXkt/ya5RSObSKbBU2V6pp8M1HtqIGblJHpBZAGUm?=
 =?us-ascii?Q?6eJ6gXT0sb84iWpg9bUf4SxUdNJHhS4clLaqJSjLBOCCxdIxh07rviZ2KgAm?=
 =?us-ascii?Q?MHLHTAj9BN0GbcYmFLPf2eyfU2LW5EqRrjkgsXJ2+7z6j/3JEj2d2fYIK2dB?=
 =?us-ascii?Q?P9VfcPXb/D70fLeUak/4cvcs3Fxi+CcShCvoHYsft47q/pA1ZTEnw6gkSVqd?=
 =?us-ascii?Q?B+ggRs5wlrJOqwsUz5LYqdzNaZPGSmnj069EGHbqt44FwvJSmSdC1zNmfOlz?=
 =?us-ascii?Q?Hb8pQ0F8OlGGRpys6r2Lt0rn/LULcJcVASxP97JD2YeQGdYpMIK8dopFGWOy?=
 =?us-ascii?Q?IBqS27rr5w9OQpoHX6A6pwOjABVZB9nYO0x1bqKtmKosWaJvPGLop0z/aOam?=
 =?us-ascii?Q?QGLzKzEixLfGkhLoaXeV/XpogOXffglzGoEAp+bjFbFcMokUFr+90GaY/6tA?=
 =?us-ascii?Q?KkyKIbidtF9QDy/u9fTMEVk4DGiDiTsmAfeLWbs1d5p1TWKQnNvFPI8cQEUI?=
 =?us-ascii?Q?BCc8cAV3U/jtlEMBs10iy3eaEN+qYPDc+FFEf/K8u3B8p8jlPh0q1fFpqL3K?=
 =?us-ascii?Q?jtxop6jzpQ7jrpNDkEGroVFWRuprnvc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ht3pqHWquip6NszUPUbCOhn0ecdCVbEoKYkzCEVxh3aavFAvGori2iN4Ve6EdcmWwuuyNQA721NspudduWNG6Oe/K/qjlitwkHK6uMSLtfk5JFLNwzN4CujQ7hDjMYTej6PWuvxCUHefdtjnQ/uspz5+9wpgESAg9aXekqnnaBUPjiBSjov6lE0glMNik99KTjs5/zGrYjZTobPGWB3fzzH7KYgQxFktkbndxTWdULBJY7Eql0TVKF77x/wNlntD2mzpihtOfrtQt/VwENY6oBzbTt0RpFQrxjvvM4/49KxNUVKRPiARrjdGkhk5varsRg37xNg4S7n7G47YnH1OALTYeEz1umW0z9OTEOjANtetxgQTCL3i2CXabR6kWHpfxnG28+JTuzp0Dim1eFL1qI/1iCPrYSP0VAo4aJxWbXYRzAkQvlzMApu7xiSeoly2UfS0rUnFPbsF5QYnlS1xw63os4xKk58oTqYbA32t/doHjB65XQA51W3Apu1IJtivZM0fXD2MQOH/kXhrufabhbQCyZlCwojn5k3GdVBVqrf/39GLEc1GgiZCChziICk2yRXshXs0kWdV1Fws1IBbu52GkE1D3Ts2R8FciqMfSiI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05de087f-a53a-41fb-da60-08de550e5664
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 14:48:40.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pc6fkbJ4uX2mLZLraVFqfbcw968xxRnB0RZzfzrip5AAfPkS0+opYE7uU1NU2MXHc4LO/rbsePN2r6nbEItHrw6Laaec++bPW5U/3P+YpQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_05,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=477 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601160105
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwNSBTYWx0ZWRfX9MPLBXl9H3k9
 NDHfnLzpkGsQ7NHFEVbVo3CrliXmOK7bnZkJAZpZNLga4ZPoya4wx6oAKWtlxlpr3fMkUdSkFQT
 zYk6jfDOMJ/lTge1uududMjkfnMoM38HdIY5EEU8f1wxmxGxW+34aChE5MCx8l6B6khg6utvP2i
 YDBzBWd0Rpw6qphejJDPet6XBp4Vk/5kXraFvdSpy48cWHnEry/rE1py5C4K4pG8OMWKPTdoNAC
 mrDgh5LGougWex4za7U+7161on3wX92pUk44XwG11a846HaVSxreb9pDpGMmuxdsNHg5JVIBSKE
 4NGXHEsBu+HavKxeA7Fo/Nv8guDe9ogVTm92NFQCBKqDFeFy1b6KSW6eZWews8HPYzchCaOvOts
 Bdd/IaOFO1+rN33d82MoKuwLs8f+d3mrjxmyYhZG5qifOg1l9CKWgw0d+kCWOv5Kl9mQup/NAxu
 2ZTtRAOB+b4FmI8cvMScvHiPOn3geA/c4pTklqA8=
X-Proofpoint-GUID: Z65GKCYZzqcPMygl9v0JS7MfVFLOnezD
X-Authority-Analysis: v=2.4 cv=aZtsXBot c=1 sm=1 tr=0 ts=696a4fcd b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-uL3XrJBjeMrVbhECYAA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12110
X-Proofpoint-ORIG-GUID: Z65GKCYZzqcPMygl9v0JS7MfVFLOnezD

I think I am missing something...  IS it your intent that this patch provides
for full system-wide tracing with wildcard support, i.e. where you can use a
probe specification with wildcards that is not satisfied yet by any probes in
userspace processes, and as processes are started, dtrace would attach to the
probes and start tracing them?

I do not see how this patch series accomplishes that.  If anything, the tests
are all using direct invocation of a single program being traced, so the probes
are guaranteed to be available (discoverable) at the time of D script
compilation.  I do not see any test that ensures that a 2nd process with probes
that matches the probe specification would also be traced correctly.  There is
also no test that demonstrates that starting dtrace with -Z (allowing probe
specifications that cannot be satisfied yet) and then starting a process with
matching stap probes in it results in being able to trace those probes.

So, I do think I am misunderstanding what this patch series is aiming to
accomplish, which is probably the reason I am having a heard time reviewing it.

ALl the tests in this series, as far as I can see, do not need wildcards at all
because you can simply write prov$target:... and it will trace the correct
process.

Can you elaborate on what this is intended to provide?  Or if it is meant to
provide system-wide tracing with wildcard support, can you add tests that do
exercise that functionality and show it works?

On Tue, Jan 13, 2026 at 04:51:23PM +0000, Alan Maguire wrote:
> This series adds wildcard support to stapsdt probes to allow
> tracing system-wide; this has caveats due to the way the kernel
> implements probe addition.  In essence, probes are added on a
> per-inode basis (actually in the VMA associated with the inode)
> so it is necessary to identify the file where probes are found.
> Probes will fire for existing and new processes (the RFC incorrectly
> said they will not work for existing binaries; they in fact do).
> 
> Patch 2 describes the approach; to facilitate systemwide tracing
> we need to tell DTrace the name of the binary/library via either
> using module absolute path (patch 1 updates parsing to support use
> of a '/' in a module descriptor to faciliate this support) or an
> module name; to expand this we then use [LD_LIBRARY_]PATH
> to resolve the full path.  ELF reading of the file and insertion
> of probes then proceeds in a similar manner to per-pid tracing.
> 
> Patches 3-8 test various aspects of systemwide probes; basic
> binary support, library support, listing support and is-enabled
> probes support, and use of absolute paths.
> 
> Patch 9 updates docs to describe stapsdt wildcard support.
> 
> Changes since v2:
> 
> - support absolute paths (patch 1, 2)
> - add tests for absolute paths (patch 4, 7)
> - document systemwide probe support for listing/using absolute
>   paths (patch 9)
> 
> Changes since RFC:
> 
> - update documentation/commit messages to reflect that we also
>   catch existing programs/libraries when probes are enabled
> - fixup provider name for wildcard probes to be 'provider*'
>   rather than using the confusing 'provider-1' since the
>   latter is the concatenation of probename and pid (-1 is
>   used to connote all pids)
> - add test for is-enabled systemwide probes
> 
> Alan Maguire (9):
>   dt_lex: support '/' in probe descriptors
>   stapsdt provider: support systemwide probing
>   test: add systemwide stapsdt note test
>   test: add systemwide stapsdt note test using absolute path
>   test: add systemwide stapsdt note test for library
>   stapsdt: add test for listing systemwide probes in object
>   stapsdt: add test for listing systemwide probes in absolute path
>     object
>   stapsdt: add systemwide test for is-enabled probes
>   documentation: update stapsdt docs to describe wildcard support
> 
>  .../reference/dtrace_providers_stapsdt.md     |  54 +++++-
>  libdtrace/dt_lex.l                            |   2 +-
>  libdtrace/dt_pid.c                            | 177 ++++++++++++++----
>  libdtrace/dt_prov_uprobe.c                    |  17 +-
>  .../tst.stapsdt-notes-systemwide-abspath.r    |   2 +
>  .../tst.stapsdt-notes-systemwide-abspath.sh   |  51 +++++
>  .../tst.stapsdt-notes-systemwide-isenabled.r  |  13 ++
>  .../tst.stapsdt-notes-systemwide-isenabled.sh | 177 ++++++++++++++++++
>  .../tst.stapsdt-notes-systemwide-l-abspath.sh |  48 +++++
>  .../usdt/tst.stapsdt-notes-systemwide-l.sh    |  48 +++++
>  .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 ++
>  .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 142 ++++++++++++++
>  ...tst.stapsdt-notes-systemwide-lv-abspath.sh |  48 +++++
>  .../usdt/tst.stapsdt-notes-systemwide-lv.sh   |  48 +++++
>  .../usdt/tst.stapsdt-notes-systemwide.r       |   2 +
>  .../usdt/tst.stapsdt-notes-systemwide.sh      |  51 +++++
>  16 files changed, 845 insertions(+), 49 deletions(-)
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
> 
> -- 
> 2.43.5
> 
