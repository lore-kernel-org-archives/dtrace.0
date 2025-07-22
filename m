Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F7A2C9A
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753193118; cv=fail; b=cDgAUfuDMdx9bv0NUWMtH0PCOjL561qaaS5d2dHqxlb21x39Y7bePKnHv03yq0faKewsBGKxifICqp5ZkV3iLqkFwpDrnRpJeWNt+ZQ7/jPIp8l7aQACoWuHok5NMM1Qsz73hX84aHjzCEaUm/dDJ31uSIbrERMIKrXg076BTOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753193118; c=relaxed/simple;
	bh=3kbstk7wUDFBCt3WA8+i6CerjcWoUXfWw4tjcqoP2ZE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=VqQvv4rxLb6p/8VF3UFtPzaa/i4wlVY73lsRRbfdPRaZBW1svJ7DquEwnsRAGyegeAcWMy8Fh0+JVvu71tvbkMH2VGwfQlK1btjfTdM0ekF3Qzp1wfSHE5W6SULvNbqUDCkXi75/mxWuYgjODm2/AJqUvzbuPALAMu1KwUr4e/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d3pyls9u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=M41XQBvn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d3pyls9u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="M41XQBvn"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDsnTZ024393
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Vf579p2rxaPL1Nlx5M
	qIs9hjoI95opCyCg+eKvSIuDU=; b=d3pyls9uyB4Fn/Snj1uP7h5YOaiTuZAu4q
	OgPok9/XFIA9orwaK8YImcLdLHksrXkwWbQ2O3KO5Nsh8P65Po3gORQVnMnkdW/Q
	z3GwqoC06ewlpGWxR1hiHeWycxQ5wmG/k5aUh2uDMUD9UlyhP/MXq0HRkyZsIpe9
	t8JW6DtBkIundziKCA5sR3xugTiwep5zGEVdjzncOAhM/YoXnLExphOv3PrvijPv
	UWxKubvXA/tGeW1iKUmSkSHxorKO/cEkEItXhVuDdga0ZrFlENnFPVRy6VezJSD5
	qrYW3O0a2XKg76R57IA7rTIn2XrEabCxinf58WstWhW2stj9JoAw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48057qwcxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:05:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCWLUV011402
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:05:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t9bj1q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:05:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoAEAyw5H6jjNt/hLNV0G1pbbqM0xVCdAeRwqWYGb6y6Hu1SRmBd3XM6RyhI2jmsSzdFPeeS/kd5dGhkDIqyYPyhUNZ4CNI6Qmod+nUAjCWe7HQVRxOs5bvNsv7oBGf8Z3/cHtUOYXaKAUoRw2Kq52tBh/Yr+ByoHD9cvNGR3wRs9zesBSKNJxF2gf+va5Awqof12OxJ0tp5sCPwgHkOi4WmKttkEeBsRksSxn3R0e3+VkDgl4Q4F5SvmFP7Tu3xC7+ONA2O/R6Y3zYExFHfAQh/oTmmcTI66SbHhKuYiziBgiWdDOv0z3XDCCWJE8kkkcTJuqJiFVK4sMZaBKyE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf579p2rxaPL1Nlx5MqIs9hjoI95opCyCg+eKvSIuDU=;
 b=lWm9yXbAl+iayeVJxOLR92MmWPcrVlUo59NsPlRGdbDbFDZ0WLYQfnOszOBz275G/2SL4uTjgE+PS9L0QHon140tIXZWdQztzheIZFdkBx2lzG5IpUwNZ+JecJqIQDdHLHrJ2VIfVQwkl21n5XSvCXaYIi4BsPnaJC1wJA/RGhtyogzQuZ6x8Mn8+PreLTGktEPI7n/cJVtTEwo6cW2u1HgTf8Nu7KPikRD22SnNDtPDJSKCdraF9ZpCW073vuBbJn0I+pMqxY83sS69oNntTU8rxaZHtiRXUjRn0g6wpHkdsbDAzfDZwO/d+aQH/spcW5BvocHd2IUsbPh0ku1QMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vf579p2rxaPL1Nlx5MqIs9hjoI95opCyCg+eKvSIuDU=;
 b=M41XQBvnEe5RJgUYVQr1N55NLEL9Z/W09aH0/Ca8NTligjXQMJB3HgzfP06+Hw6UUSnIATnIBjJBOOvrR9gokaCvCogW29HQT3p4dl/YDFmOKmk68q8zaNirLUf72hJ0KkiwB0V2/O7nVWOnuUil2i4vRIN5CQ2hSW1QJqtkATY=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CYXPR10MB7973.namprd10.prod.outlook.com (2603:10b6:930:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 14:05:09 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 14:05:09 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/4] Pad strings in the output buffer with NUL bytes
 after terminating byte
References: <20250325222521.15224-1-eugene.loh@oracle.com>
	<20250325222521.15224-4-eugene.loh@oracle.com>
Emacs: anything free is worth what you paid for it.
Date: Tue, 22 Jul 2025 15:05:06 +0100
In-Reply-To: <20250325222521.15224-4-eugene.loh@oracle.com> (eugene loh's
	message of "Tue, 25 Mar 2025 18:25:21 -0400")
Message-ID: <87seio723x.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0474.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::30) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CYXPR10MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 13edafbb-2ed1-4d7f-f46f-08ddc928c4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/PK4tRyT5LQalljM/5+Ar1ppSQy49PET6MfhapZ4bnuInSINuaFkBmcHI7Pf?=
 =?us-ascii?Q?LS0ivE/uJKEqLTziGxPoBdjfr9ZoLvETP97uMmIiAZDMFNT1dPo0ITi7uT5w?=
 =?us-ascii?Q?yiidEjjgIsgbfwlOuTUxZk6cjtRV9QnCSrUdyvC5btJgCHlwK9mNk5VaDje4?=
 =?us-ascii?Q?/WoU6hXWU4gRscomNe4p2+5TNM6pm/pi8rwHaskDx54DwXPzfHQpkFNxZtLk?=
 =?us-ascii?Q?LOavlXdGQm5K6SXl2IHnnwCwX4nI/fNfk2QRcrJ2vZywKLMcKTNP0kLY8mR4?=
 =?us-ascii?Q?4TP7JtJuRjv3kZVMiujKN9dC6mM9Ui+rKtvjjBXodt5Ki3kj+awT9b9ZSCcJ?=
 =?us-ascii?Q?K60uN+0BpfqLkxJquYMXcmV3PcaxJ+eUFI/8piSVK7par2OAsIyjg6cT6oJm?=
 =?us-ascii?Q?K2rCtgjBKZR6rlq1C0WBP4lyyJkmgeysjCHXAedcj0Hc0uZD7HMwaERejzF2?=
 =?us-ascii?Q?GFwCiX4XBQp3aT0OdEVV35ChrcYq+sh43FV/Z+fjPe9mcIb6yKrfcnyZhXgn?=
 =?us-ascii?Q?9Fkvj4du/2OghIoWs9qoTsFxnuZ6z/g9peghAl1QTsbVyk1RZ1FCIfATUDnj?=
 =?us-ascii?Q?7E7EP17Eqha1+bi9RwsoTKa8QRMTCbTcXnWhUc5O8UIQ/86B9v6R0HuBqJVf?=
 =?us-ascii?Q?YEKCSFEgQ9rOgjSDU2mIifurX9QPScoOBgUpaTB8B9uVvsmonc2FX4LfXV6g?=
 =?us-ascii?Q?Te3/ACGzRdXqs6e80DLbeqUHq6bs6kzoTi1TpHhqndWrf4JCp4jDBF/Z08DR?=
 =?us-ascii?Q?UcOj89mJ6UxLlmGuQaqXEhPyUeq5maS8s4JytbLd+0FrEUcpRDkBSpTg2Ynf?=
 =?us-ascii?Q?2Nm00SfKzQQhqbODYGnuc+nhFai+074RGAl2F6iyqxhpeeonan21KPeRzjPi?=
 =?us-ascii?Q?JOvwNssLFWxayVJmbl7aa3+J7r4tETNgghco2+MOSIu8n0dexdd6omVtruh9?=
 =?us-ascii?Q?PwZMlSD5yzaySerOAB0DY73OheEmysAlExZ6A7XuPH6Wj8G7vx+vKdjtOAf/?=
 =?us-ascii?Q?rkc1vYsJyuKSdHUHSfo/bFL0BAkvQu/C3++hG/i1Mf9aGZSE5Y3sy4cAHpGj?=
 =?us-ascii?Q?dD16PNAxDyoWJrffPc4oAKKLmXrO8WB5/4VQG/qWn+y/eAYTwpUI6Zadq/cF?=
 =?us-ascii?Q?1Bm9U4DPRQ762J436J2z6uzjuiXOOTv810VtyG/iNCc7iS3rhjwC7c9ixvPf?=
 =?us-ascii?Q?htzhdb/1q+IfqSiCXc52NrI8M/A/6RvVL9mDS1F1vVtZpDmGM4Kvr/D1evxq?=
 =?us-ascii?Q?1hdcAWZ20bnOt4H+ZbYZ6LQyekME/DhHxg1caI4C+ORlavR07/BhSDICEmth?=
 =?us-ascii?Q?m0kroHdWmXwotimmSCMoU4BGtw2KXV0grH1fTTU68eOjdWQqojcRuuiLR6X5?=
 =?us-ascii?Q?It5WLsgnPre5pnRnDRteZ/uUn3i4DZmAEphC+bXnYvhMCDFku9PVR5O18qP/?=
 =?us-ascii?Q?Rqu5TBfC+bU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ezNt42c7lAMgSV979QV94ReQsBBCpCzIhSgsz4KutXiu1/BBU5zCpWBgSl70?=
 =?us-ascii?Q?lBPAQNHQjHIj/cTT6QoX7X9IStDuT7zjQKcfQ/zzBOCP4heqNX3uOvGqDn2a?=
 =?us-ascii?Q?s7RhJV9AcG0BcUI3h5VS3OTDAytJQ3ACP9ceLfdryWjeUYRKcDNvLQMp0mDQ?=
 =?us-ascii?Q?gKo4hb0T0LsqIBgJL3L9/vLsOF1hz2sYb3mXK0VRw8RoOAqqmiW2odj5bhV5?=
 =?us-ascii?Q?HtU927a0Z+5iDqxjmfUut8v4gbwcCRg34YU1Cs9suhQmvX00A7Hi/u78e4Sz?=
 =?us-ascii?Q?SEYIYWS7Vya6EJ0sh3Xe7vTQjK4SPRELCWCeyh1MGF9yCvaPa3XRl/jGfiub?=
 =?us-ascii?Q?m2Uovd3CRSE1+/Pjm5bq2zdlKzqcGvMMRN/nrLaEOrYB0lTXcrqhCvFrWGco?=
 =?us-ascii?Q?F/kuTteVwvNfHYZit59W54s5oGS1rOrDIdCo39SBaaN6rh+hxZAPVrZmvvPN?=
 =?us-ascii?Q?IESZyp4pNsoVpJ+ANPA1r7RKvXp1osteMtJ5Q7z/3QvZneIcULYpmqzARq2V?=
 =?us-ascii?Q?rlWZ5WJnH7KIMjJQnMrtNifB3IHm+5euXEFZE+o+2bvGsjNplO7QAX/y21E4?=
 =?us-ascii?Q?pvJWKu6XHdEJc7406zAOAzHksUuawFiuj7l5hQS1TCGuxFaDJZUqKYcVm/DC?=
 =?us-ascii?Q?8EoY5AcQ3X2+zvCgAKiuSpOaKPRlPa9t6uxAwCLoS6j0Hu5gKavU060NOyEJ?=
 =?us-ascii?Q?FXw4DJFK9uf4kAsdlWjjjMHwCk0ZP1c0oykVlZITjw5wpxujnsuia7nQBG6A?=
 =?us-ascii?Q?vd4/Ch76+jbcEVKX9oGuNJWjxOJzcDFj4uOoBVaAQsU9DZ5JLXq1YVTKEaJq?=
 =?us-ascii?Q?hZup8whIeZW/w0LNNFur9hc2WAvfKA9Pr1ea1xxCau5iVc60/AUGHtV+BAyx?=
 =?us-ascii?Q?9exW1lJykjtDpAhLXU6/qIDM56Ld1cuTEBG5a71WpmcrxlHf0cEawSlYUuQF?=
 =?us-ascii?Q?1RXnzel93IDvxtr92HKC+ue6b9F8N8/ThouU02pfMwG52ZgYYRzK2pPpoLP6?=
 =?us-ascii?Q?NueYcMmSR5hokrRns9T1k8/5Hibr/4MS0JIW3YXhykuGzA0o2NCZ6rl1RlZ9?=
 =?us-ascii?Q?iMyTt+ZlniXSUJHVDs4BXyDLspI5yQIy608DNjpcMCdffZeZFK0QRvNmVwgw?=
 =?us-ascii?Q?BKlG5OQkKWImBG5bMitDDE4wi/kcnHm6uOI+J6t3agcE9yA1iMhtP5QxVJZZ?=
 =?us-ascii?Q?ygpEUIM5TVyxYLBEIUssTZkyPh7pb/HEKtATyOnpYtca6++oEzxBcUsm37oO?=
 =?us-ascii?Q?3XDi/KOoQj8TW8yDJEeyCX7cbURC2igpunTA9o98xcQIIlaJ6R+b0xQ1RKrf?=
 =?us-ascii?Q?atScKkTbknvn8KCsLvWBZLZctW2QEAgtaiKm08LaofnmBFBNNkAa6+huN3UT?=
 =?us-ascii?Q?K71l4f/QRfsuZyP5Mx/bynU1csjiEi1ojQkcJjhHknAH5eZqPirurVywrDvD?=
 =?us-ascii?Q?Pg7IHHtygip71DopNQjFv/+JLRyy1SbFE+2vsFVOaniAHZfsbU/AenTTe209?=
 =?us-ascii?Q?zeKJunJbkUhrtd7Gos6T1b/ZKNDX4bkemvHj5zimSCwpk37Y3CzzbDlVBQ86?=
 =?us-ascii?Q?/8uv8AANco+Ma/+mMeYfznWI1u2ZI6/V8bpupSBXh+AAE10l3ZTNUhKJBAN+?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bdjYPuW+to4AuIjfvdR8PT+0S0ThBI4nD4evCqF+jY6E0VwRWdica7LMRA4wkMsVtLko4x5m++7DCfkb1bbhsVcpFtZmaqgqr0D25kbBih3wmiN98BRnATNOEvDoXvUosRfhU7RkIqJkpjrPFHiu3dECagkH7M33EyvbU/syBFrn9BjnHIOu7a6YfnwNa2lFhsKFW3se6qDJB4/p/KnqnsLmhlfzH9WknhiiVXm2f5jznDDDcwyKADPQcGg/wrDt8A9GhJLbnfIu/e4X4SOmFAWcc7ceknAhIyme9871O6kool+MlzYCOvn27nWpjCf254Xyu4IoaE5zdvwNIdAOWvyYextGKaPBsxpoGmr839+2xRct+uGH6XHWQsi+ecVEt/c3GCGrKDw4K/zg/LoAVetQn3b1OxW4xiVZ8Hf9Cj4K5Jpvhck5931Mxsx6pHjoropLNy+m7JM8SW2dDAScWz98DTuwyrqU5g0GcwrzCKFa90Duuz5AM5l+HQuPlo3wJ0L8Mir9V5kekIOeN36Xh1QflYreOoj6AMLqo0kySvixKdoCdlvJo4ZalzZg2rDRzFwqfJNPJXAXaTyeQGN76OTu9lZUmzTrteALJj/NiuY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13edafbb-2ed1-4d7f-f46f-08ddc928c4a8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 14:05:09.4235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jbJiMaY3IFgttYCdYzhEZw38yHE1C0uk1iaf7dhJ8lFJpHkQP/R1DRRJM0prGOR5K3NkttsRHuz0vYlq6hdKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7973
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220116
X-Authority-Analysis: v=2.4 cv=MNRgmNZl c=1 sm=1 tr=0 ts=687f9a9b b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=_WP4qOREwc3G_INcKoUA:9
X-Proofpoint-ORIG-GUID: 4MdtkYLxorpwWrmvKyBOcKHjXUeNmOJP
X-Proofpoint-GUID: 4MdtkYLxorpwWrmvKyBOcKHjXUeNmOJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExNiBTYWx0ZWRfX765qMf2dgdrr
 NLr1N0GV0liC3H8/o0kKXgpBCz1pPWhbzgVYCVHvsfzsQDoRQfQb6zb86QiqixOg/PfOmIgWEsj
 IuI+6a1iLbfDPsFVNi3EVME5AFGsaYA/kkPg1kQN+2KyCgSMFT0Tm4CDbPaWHnJdZZWR6I3Vcj4
 eC9F63cX7TlaxVSdMbo6BxhbzpeAPZzX5yZnWrdZcyLQSFrHg06LFwWvgSksArD9AxhcTYrY/iV
 GRIORcfiXKvqN0M/YC2n9m/VZMIsDmAwziSkg16jp5ghnvLGfNzfFOUmwpmvxHTJjzxVaNUCQ9M
 kXdaM8Zmi7bObRCNt9teXIKJyo9k3Ebd3ourZPvMOg4AzA6+xVX3keEz5eD4ib7k8Y8bM+neSuQ
 QHgpD9fCPJF7gq1nomzTnrC7ZI1OOvLnwrHcUB8wf5R6jO9x2dGPHLJCg8Bb/7KKXGoLs0xX

On 25 Mar 2025, eugene loh uttered the following:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> The consumer checks if there are non-NUL bytes after the terminating
> NUL byte to decide whether to print the contents of the output buffer
> as a string or as raw bytes.  So, for strings, make sure that the
> string is padded with NUL bytes.

Ugh. I guess there's no choice if we want trace() to work properly.

A use for strncpy()! except that this is BPF :)

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

because basing decisions on uninitialized data is bad.

(Modulo nit below.)

> ---
>  libdtrace/dt_cg.c                      | 46 ++++++++++++++++++--------
>  test/unittest/error/tst.trace_string.d | 26 +++++++++++++++
>  2 files changed, 59 insertions(+), 13 deletions(-)
>  create mode 100644 test/unittest/error/tst.trace_string.d
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 9b3592b9c..6dcf4cd3d 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1596,6 +1596,22 @@ dt_cg_check_ptr_arg(dt_irlist_t *dlp, dt_regset_t *drp, dt_node_t *dnp,
>  
>  static void dt_cg_setx(dt_irlist_t *dlp, int reg, uint64_t x);
>  
> +/*
> + * Store a pointer to the 'memory block of zeros' in reg.
> + */
> +static void
> +dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
> +{
> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> +	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
> +
> +	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
> +	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
> +}
> +
> +/*
> + * Store a value to the output buffer.
> + */
>  static int
>  dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>  		dt_pfargv_t *pfp, int arg)
> @@ -1676,6 +1692,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>  
>  		goto ok;
>  	} else if (dt_node_is_string(dnp)) {
> +		uint_t	lbl_ok = dt_irlist_label(dlp);
>  		size_t	strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
>  
>  		if (!not_null)
> @@ -1702,6 +1719,22 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>  		dt_regset_xalloc(drp, BPF_REG_0);
>  		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_str));
>  		dt_regset_free_args(drp);
> +
> +		/*
> +		 * Pad the rest with zeroes, if necessary.
> +		 */
> +		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize + 1, lbl_ok));
> +		if (dt_regset_xalloc_args(drp) == -1)
> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
> +		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
> +		emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
> +		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize + 1));
> +		emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
> +		dt_cg_zerosptr(BPF_REG_3, dlp, drp);
> +		emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));

Much faster than using a loop in all but the smallest cases, I suppose.
(And the zero block is presumably always big enough... yes, it is.)

> diff --git a/test/unittest/error/tst.trace_string.d b/test/unittest/error/tst.trace_string.d
> new file mode 100644
> index 000000000..4b06aef88
> --- /dev/null
> +++ b/test/unittest/error/tst.trace_string.d
> @@ -0,0 +1,26 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test ERROR probe firing.

... is that really what you want to describe this test as?

> + * SECTION: dtrace Provider
> + */
> +
> +#pragma D option quiet
> +
> +ERROR
> +{
> +	trace("Error fired");

.... given that its stated purpose is quite different, why not describe
that purpose?
