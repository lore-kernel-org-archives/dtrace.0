Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F014A00
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908966; cv=fail; b=jPeyW69fX4Kfv/kw7BMJ7M3HMUqR6X3VUO8hW7lKP4IZP9jmHL3GcSXrI1v58VXE2TzCOwRJCLlZUiKy3B+kalM1fmSnHeotQlIH+8TL5QPo9mpPDhTTKRo3C+aN0H6akDuBBxYB3bZGI0LYPPm2/xBCPP+aX+sHNPT4vSjPM9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908966; c=relaxed/simple;
	bh=nofzJal5Jny4NUM+dsboLhXwABUNxzwka+l7omgRwoc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B7XrprJk6WQLCHstibj7bFWE17eIk41jkbl4E1V6d2IjBay4TEAgp97axDH1Hb+tiEVaWd7lGeSHjuh58epld9xRZK+IV6L/czxIl1Q8uYZCynXJ2i0c3dIPVR8JrACFr0I//TKT0I5aO7my7OH7mKOTrE5GwbjsabbrCRxDHv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mZ1sOkEv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qIJnIy1e; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mZ1sOkEv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qIJnIy1e"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1g0TX000310
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=qMJzzG3G8/o9Vc
	PHrqvsRlPDn0aDNbfpKjH1RyXHN6c=; b=mZ1sOkEvtodIV/N2bBn3e8QyaawA0a
	wyo6r1ALxwmjzMeT1CuA3Nb4B9tW9XEHZh3uxF54XkDTOy6dWAz7g4eY2brAsLJy
	BwmH0p4m7td0AZgz7OA9B3CZLvhVuotKnsAEzXX9Z3ljh+WAyQt9oOGDXS5MOf/a
	3zDfkHhUdTYENLsEkLi5ajm7SaPuXMomC3zYjgn+SmYqFBjmea1+HFqJNEp1qIE6
	ucKtANQpw451CLs/6NMmrV3+nqqsGS4WVaAEFyRJkfQeM3X/+56xTeBX87GIyDPH
	WuGGuCa6dCmRSDoCAGclyI6ynM9MT7HO+8TR2pzHiayCi5x1cj0zz6qQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukub4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4W33e036604
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jmrp9b-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cm7wGHWAhYs7FrKZJ4zY7ividN3D2DiL2yBDRJSI8mUeD/34U1a24Gfp50B5RjoE0oz7JPSdlK7/EzETZCs3blDNgsPq7Lj363VoeF3lBfpWMXgIhtQP3t2h/ck60VK5EjGALljicC3C9A2ZcquhJ7++6yOgXesemq9dkVzFUQRAZRBq9mkD4kIRpcOMEKZAnkFQoQjNlE0BYQw/nCQFsukliogNoD3lN0VQ0EMAmgE44Yow9Brby+XW0beD+Igq1xrmkLHwfWfFWSkof6N53Hj4Y6Aa/RTEaFfEF2hVEl3vY7y/2bhHSWHFurXy/uIeRyjpv9QaaahHQ1ahmzGNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMJzzG3G8/o9VcPHrqvsRlPDn0aDNbfpKjH1RyXHN6c=;
 b=wdsaPXDyoK5PtBtZDzX36AvDi97ZtLiAS229ddHbS45CSsWG+R24CVQF7UeNqVN/SgtAb7uqf1kLqsy0phBuGXsja+N3RtaBznn4FV2aM6YipZixD2+Uq4Zk8EI4e3Nc5Cm6vZyuoxbbkO+fEzQS10tuV/xkc6R2radB0pSaIuoxtDFoVtDibjq2YAUsL3NT+u5SYKe5XBfZA0iS0Mp24frcHfKIABLkDpvGeCcLCGhbmWS/M+idK9WJ/6J3Lx1vlOoTVWrgiplfYR+iLdrwq1fPzZkfam2G/WXEQ4QoB579zLDZdPnev5/Gtaw4yvatZSqGa4X8nXoXExFXuasFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMJzzG3G8/o9VcPHrqvsRlPDn0aDNbfpKjH1RyXHN6c=;
 b=qIJnIy1emb/sH1oQdulVt1tDgDaHsJXBET8O33BmJeLoKxeYLfcKHzi7u0JcTuqoxKINYjyRQyE79YA0y5Rr9qQj/perec3M+gVmpy0pT3b/e3TM/FB4VQ8/N/T781DRvcZbEKeJEcuHUS5uuNaaNyq3daFt56uHMVWI6TxM8p8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:34 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 09/22] Clean up dtsd_* members
Date: Thu, 29 Aug 2024 01:22:06 -0400
Message-Id: <20240829052219.3234-9-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:208:e8::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 25321a7d-3038-45f8-6979-08dcc7ea9688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V9PwwN0eVlJFRows55SS21IslQ45EMB1kWdH/eZiKaojfW3VZsdJN+tWvJKy?=
 =?us-ascii?Q?kfFIlxg0bgzKu7MbuzCPu+n8YoZOFhwUnfMNXW4gfTyMr1n7Irj18c3xz2qt?=
 =?us-ascii?Q?0GvPRZHgTBy7nqpFYgpn7TdJKT/rOEhWh9y7DI1qa8NsNOON9vihRFraHbtr?=
 =?us-ascii?Q?+8kRnSpeg/0/c+s71jZ6glyTwoXZFJa2c8+uSzznh1bX7aByQH2bkvdBFwTh?=
 =?us-ascii?Q?ED2QnAz/q971rf7BVo0sMQvoJWTTfBX90E6pH9+m5Wfs4W3WuerQ8F9wrJiz?=
 =?us-ascii?Q?Ut/jJfgYu3UDDP7jB1KD+v8fxpuLrBryGejgRa7Z/CuZ7ZytPuIPZO5irLtz?=
 =?us-ascii?Q?++NQbySjKteMmqGP88ybaYxepDRAqBnl0cI9eAHGOnVJUtwlPlIg+jLCHf3L?=
 =?us-ascii?Q?q7GW1LBPCObUjMgEE9oJQ1OjK7y7oCGBZnqyQB2Yt9vE9aonjsLWXUIUeU/0?=
 =?us-ascii?Q?GE8uAVDrBODhb+yQjie8q0wBROOnHNKe9/NplH6HqItXWtSZPDcd2XXG+qKl?=
 =?us-ascii?Q?Hies4TIF6Z28Vb7Lf9u8TPIt6dkVG3luehT+raljwNBgM/hvJgpL8wsxsB6A?=
 =?us-ascii?Q?4fGL5sU0t3RlkAIrW4V1rkL/fXBVZByvXsiQm6l5RYeDT9qYA3h9IPJwYBD2?=
 =?us-ascii?Q?9ODwwf4a4Et0qbnwCMooSxaAqgsQ8NHiX4ioMbYFWyN0Z9KxmOtH05tMCJkg?=
 =?us-ascii?Q?Y4M+BzY1fXHFu0X90j/OTAFyhZc7ANIHhEfbAYv5oTzcP4ktdk5WnEusjBPj?=
 =?us-ascii?Q?3tbux6Y1yJYGn7fKJUL8NyvhEmZ9F2/bmIHdJSEUkbnpfsFOJdCybxn5cuGS?=
 =?us-ascii?Q?taBIohalKq7+smgOSSJvpLFI0XJqZrYLkYZedbXHYBH0k1cDNjD3izf5//09?=
 =?us-ascii?Q?mnTU9FcQsLAmMZjc/Jc3NbVWwzPcs6lV2bTtoqlNH2o5PZgYmwuSeik74VdN?=
 =?us-ascii?Q?9dDorSrfzAanvm2mdIzM1ymiqdjgGqMzPcMZnP4h2bX2DAy753Ke0fqHGLdw?=
 =?us-ascii?Q?733DM/vkXP6Twr7v4Bh2bf3gLTveb8oKrSk53nnhbgN8f+/zbwSJhBfNhRGU?=
 =?us-ascii?Q?5KuJPCS5NHT1yId7YkNxx2FL4wS0ZwULk5n2shFa9YbchSfQA6bbv++OMoJY?=
 =?us-ascii?Q?1aDsJeYrC9jGaSPNd6J8nbePeTSyHLJROj3oYj7aX2q6sawSah8PmIueyK7I?=
 =?us-ascii?Q?viMzuAuwpt1P20l87RQBO84OsCC8eEur3rgRIgnX+BmUUeJA40CvOxxiBKju?=
 =?us-ascii?Q?/TZ/kVNInUiiqOWX6ehawSdxMqncexiAzAvbsp8JXLyMelvHTYZo/dS/Z2SY?=
 =?us-ascii?Q?uMFp494nqXZN/54IDXbZWEGSqT9c+GIc9aiSn8NtnIYmSQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3tgjCcMRmNus1FKm6iVljnWZ1zsBQVAmfo/0gOmAU7+ix9lc3VXtyrcmQGpf?=
 =?us-ascii?Q?K0qP4K+mLtYKEh9lDfb/E5ugVzCncEpPGLek5aTW/1YrIc8pMFCH8sBTxufF?=
 =?us-ascii?Q?C75l6BSuVmTw4JbKoWDkbSrKvgJyrtQqaUt3S/xORi6wF04NPl7x4pawEKmb?=
 =?us-ascii?Q?Kjvmyu8rgzUYnOoPoQ8dGVVE2y/bOD1ycOccczbZhtPatowJKPlMfxGol94/?=
 =?us-ascii?Q?A5a7LLzN0BG+4l6vEaQK3rAUQ2TxvnnoayarYe8M9ZbKQjk7kolRVFDnFTTP?=
 =?us-ascii?Q?gSK2StublcSqDErlTY1T896frdVEdSSZp5M5yT+Wf3RV82k5OL7MERGl5HAb?=
 =?us-ascii?Q?fPXENwG9JUdobDPi9/7a5t1Qw4lvAq1vZMeFZnn15obXub/c5Sn3/ODecTOt?=
 =?us-ascii?Q?hjVvR1DLkxHlS0xoxnj9Q0FlXNYcN3MRDFaEbQA1yhMaGKSOY5EhTEkSS0Pk?=
 =?us-ascii?Q?lUNaOnjIABBK6+Clq9vcw+UFL5XOgUEbpAytOQUIgLJ5Ef15C1RBHjWlaNGd?=
 =?us-ascii?Q?GohzSqDy7ryX7+mj46AoNJ+65xVbZ26Uk8PXg/SHbyfKjr2OSZR7SfDXjla3?=
 =?us-ascii?Q?K8eT8sGnFHmUHOsnDabXzu0Lh3FMlPMKE+DsxHQVJXzecBHEwHrFRBexRlBs?=
 =?us-ascii?Q?crFK9hMbizMovjNL5Ogkjve0WRlu1oGs1meM+Cr2t0Y6L9WtdLD9UQhp16pf?=
 =?us-ascii?Q?RDdfC87j3fMV6zCnU7u4SD0P12vEIvuEDMOSodcz+teK72Txvmgnsvbm4V/u?=
 =?us-ascii?Q?t53fMVWoau9IpTRbuPuN22NhpA50EsEZyreXsrY4i4DR0tENPvH6z7e5w+WA?=
 =?us-ascii?Q?swzq8Y/GeDaJr5ltHa8/eEYjYDv0ZhS6FDl1XpLEIavHtBmkBJdwcHM1g6ff?=
 =?us-ascii?Q?Tu+93QuZsszaWr6ZUu29QWqHRI9gKTyvyYzOYd+hQly6tpOYIGkTlW1ogN6q?=
 =?us-ascii?Q?sDOHwuyfjsjnocmVpfFlk1s416oSdSsOle0LBHwW6shtLvMpyp2TI0bu/jen?=
 =?us-ascii?Q?d+EiK6bEmc1WINlNYBwMUmttw/tTqrLeP2NIYqecCKJ6HISbfc41bVadEaCl?=
 =?us-ascii?Q?uT50Zq7oS0DfBvx/J4uEDIU446mzxLxSOhVYMPZ7VRQsPMrswZFfZqG0Hmg9?=
 =?us-ascii?Q?t763UiTUOvWsvjrhxh6+4kw7ghrSnEOpiBx4INskdL9pKnwnaexhh/mcZgdf?=
 =?us-ascii?Q?jUk1n1lExdKWMA0fu5XjF5mevoeViowqKYhvB5UBuRvKKly032TaCvIzJzhZ?=
 =?us-ascii?Q?5eyzEBksWpFaozCXu6hktwH89G2fXYOZAPET8PkQMWhW3vbcD+JVozgRK2Wc?=
 =?us-ascii?Q?ZYJfLF2OVV5Gy0ykpRh8xeAv9UBdVvjRQtOD1QxB3GKRHx/q+yqDbXHoKEm5?=
 =?us-ascii?Q?gr10KO2hIbkFnt7hSIaU3wp6czz5EZ0mmx2GrdDI3Kela8wIWEFkwEU3nPf7?=
 =?us-ascii?Q?I7WOiIqvm1GSDvgK2smvBkF+m9p1xlkxOuW85SBB2LZNaVQNIlmvxmsEzFjW?=
 =?us-ascii?Q?h01WwXidnF5/8lxOvcbEXBpzweHuBhcpJ6+UQvIxEE7x0gTRjzs+xlovO4lB?=
 =?us-ascii?Q?mbMfCkaUq2DFEz9RJIoSgIOJySfjCa0QsYOqjbWd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8xaMCUrzF7FRzECHGWENOF24vLtTm6ypeKBD81DnSWAKPu8qF766NMt+6HGfyJxCldR9ny4/L58teyza6aHWglrnAPGJeg0L/217JNuHL178brl9KXg5A0UQaoRjWp8jK3e9Z2NJ90DpoY+tNUB1OjlmCJ+4rwkTTS1UgOH7L/4zUM59e2EDPD9UtnzB6kw+94dW6aM8JF0K7+P16Mzn6bhXWuf0BFbK3OY1Ly/PYUiXxqHTRo9vgpAmPMV+0XgyQ2uAJcpQWwCxVKPNZfbd0mMuqYL7EpLnqEZa6OgFgFCEP7utTjcW6PUdr4NpnxlW8X1gs+rB4/AwSJT60YrBFqWAUg84oGxsKxrMZ32NsMm88afPTzl82+KbbzNXKXmf+Fjkw8+4XZq8t351CtzvDx6ySOkLnUPJ3KTE/3DzM9SQB+DDfD0SLN3KXI/+mxFAT9d9hvuiXyoLeXAeUwR6hYFM+wzCcSpIQSiPCbyFKShupiJ1YOMlMhc6Y4qoU7qgdZutAeWCXSr1heJYSxaMFMcj6j2jlqaWuXnDJS0GJV4IKNyomagqWHNvcRhRNgn5EkMlCVa2bIgew9OqL/kcDhQ8jbtCMzSB8bkBIRzYQog=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25321a7d-3038-45f8-6979-08dcc7ea9688
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:34.3493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXwPCd/zKfpW1dic46y/wAOmGi3C/et77Krlb8cdpq7RA3b7PcWVx8sYo0W2oefKBZMay2bHhC177ce7lohxdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: 7fYtHe2p9OF4yqWRG02OfFv7SafLiYnn
X-Proofpoint-GUID: 7fYtHe2p9OF4yqWRG02OfFv7SafLiYnn

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dtrace.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index 8f40a581..09a87977 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -146,10 +146,7 @@ extern void *dtrace_geterr_dof(dtrace_hdl_t *dtp);
 typedef struct dtrace_stmtdesc {
 	dtrace_ecbdesc_t *dtsd_ecbdesc;		/* ECB description */
 	struct dt_ident *dtsd_clause;		/* clause identifier */
-	void *dtsd_aggdata;			/* aggregation data */
-	void *dtsd_fmtdata;			/* type-specific output data */
-	void (*dtsd_callback)();		/* callback function for EPID */
-	void *dtsd_data;			/* callback data pointer */
+	void *dtsd_fmtdata;			/* type-specific output data */    /* FIXME: dead code */
 	dtrace_attribute_t dtsd_descattr;	/* probedesc attributes */
 	dtrace_attribute_t dtsd_stmtattr;	/* statement attributes */
 	int dtsd_clauseflags;			/* clause flags */
-- 
2.43.5

