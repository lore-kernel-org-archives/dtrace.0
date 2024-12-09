Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D737A13D638
	for <dtrace@lists.linux.dev>; Mon,  9 Dec 2024 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733761772; cv=fail; b=o3GmwShZVzbbVJxEpJ/rMIML+xK9M546RjzkbdCj04yua3PZluDxGvHXg8z631aSNScI3oTL7KNzbit1uMNsrZZE35NtVCykb8m9p7Zj6Gm82nhvBOAacmyTFN7Wj1cYzMpNxjfJz862BUGUeHVsd42WrAOvqjSK1tz8h7faxY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733761772; c=relaxed/simple;
	bh=O569IZyAks5qaT1C0X87StMbOMbcbc0pDixy8P7d90I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=SXerC/LG8WKndhdnyCmiv8fs0Rv0d2OPUCLpoSr1MgOVLcEFxCzZnDnn3mK1C8TcvBqtw+NrX9VH9FDzPb8Tdi17h0vL5FJ0LJ/fedcFWgLLhA89fiJVPxETRulrNTbyMr1V91461M5j2XKSrzknDaguPq2mMEzUhBWEuLD1aqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NR++CoFi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BTZdB59X; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NR++CoFi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BTZdB59X"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B99hOB8004632
	for <dtrace@lists.linux.dev>; Mon, 9 Dec 2024 16:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=FfeLY+VcnFE2GHun63
	IwaDYs4ImC2AlzVk4NJ8WtzRU=; b=NR++CoFi2b7QFPmKiyk66o8txby/fMRBXo
	ax0F1TdgMIojlhZs+oEKVg7Uvfp6guVC93Biid0v0kzq7b9N/MO9r00vij2dHgf9
	ONVmiUwTTdcK32EIZdrcKnitnoMOgOQXfklI4cKuw7sR6VMV2lBpR7cQhOkgRFdU
	ex4hAhg0vsfd/T/vfIrmQNiusWl5hDn9Wdnx+lyIJQfKaulZWbm+6fkRqnKmnsES
	JpVdyBJy6JI3KIwhI2RVu5A/Ag3j30mhYimAEns3zc8XEbBpavLFMPehaI4b+/z5
	k9NbdkycT/3ofKXkLfRRE+bzMV0RZsEvGomTQt+mPfeGuEW9dEUw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43dx5s0skb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Dec 2024 16:29:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9GPMHx037979
	for <dtrace@lists.linux.dev>; Mon, 9 Dec 2024 16:29:28 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctdne33-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Dec 2024 16:29:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFID4F2GTpQXZMlMUCn5deko8QDm0HRgC90vZayBZt4avRbHI72qqryqRp6VEr72dOuUqDJiPzC1ZMXDaPVTlw/54m/Fq+xLozaEyFQQD4kIYNZmJDIRhn/hO1l7wLts74fzeDiUP91yNAtjHGOYf7NVdJA5e4A7yNolc4ndIJltMllq5b45B8NJTN/kRIFS3/uiqpyH3+Qw5K87RH4sAPrykmUnSInI6v3uKCzqE+zzW525lAFC75ydO9/C+1fJqg3NyYwErBdUGHzxt6e7oN0OZQH+7z2FQUV2bPksKCcQe0E3jj0CWHNhwfOMYt5Y5C/1T+hfR7a/SCuFQQJebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfeLY+VcnFE2GHun63IwaDYs4ImC2AlzVk4NJ8WtzRU=;
 b=WtyYYfE+xjWvc56tIBHmKOnkKn1EzD/8p63TDXPKQe0dt09pqC+cwyeyLO+qpgV6fYfaiNxpm0pyECciRBQKGmGOfk1PrTfEtNID//MIPD3LelvDBWz7CLv6mGyo/cHaJ2eeQNDJcZDJ/3a/qjybWDVxpOzgqkxok2iKtOnCjbm5/KyZD4m2CnJtdr05ddBBDDcKfJ4lLCgl2RfzWdwYdFSYvCXlH9eXOxSRLVIXzcFwwHKQxnFKjIstTyPq/HZm4AXUpCXGQp5eF9LxJV/3seceWWaDGKYN2vmvGwa0LF70zAzDR7B086E8HZp/Whuxnh1M1Rqh6oFPR/l4H7zlFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfeLY+VcnFE2GHun63IwaDYs4ImC2AlzVk4NJ8WtzRU=;
 b=BTZdB59Xa0wPFmKYMavXy3TGZEQ0pg1/7xgaRm7CgwSc78CKsoZE1WRSwmvfFyJfl9Z2HDZ8xG0P4GPb8TWIAfjYaC4SODqJnjprPFjmRMCVfVbth34LHu0cVXPe7V0XjZxk40LfoBTFPPWhrxSbteyI2MhlNKq7mPrFYdqWads=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DS7PR10MB5135.namprd10.prod.outlook.com (2603:10b6:5:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 16:29:27 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%4]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 16:29:26 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] rawfbt: new provider
References: <PH8SPRMB00374BF4E363FDE8B36D9E86C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
	<7b734e3f-2892-4282-9067-1b3ed69a8262@oracle.com>
	<Z1MncJ4JVhQBc3Kz@oracle.com>
	<827f0154-48c9-4092-a8f9-5f5116049899@oracle.com>
Emacs: because you deserve a brk today.
Date: Mon, 09 Dec 2024 16:29:19 +0000
In-Reply-To: <827f0154-48c9-4092-a8f9-5f5116049899@oracle.com> (Alan Maguire's
	message of "Mon, 9 Dec 2024 10:37:37 +0000")
Message-ID: <878qson7kw.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0148.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::9) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DS7PR10MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fccd1a9-5f27-44fe-2974-08dd186ea5ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qjlz8rMQ3zHR6cfHMcIXZx1+Glg4ZrYapn9A1/6KpUFatRlqdxpGR8vTORIm?=
 =?us-ascii?Q?In/Zs6fsh8TtVu0oWpajABLjpyRRJHVXzWwa3LdWVsfPrfj1IhXga041XD2x?=
 =?us-ascii?Q?bGtDuV/VAtm8/0La73x62BOtnkXxuQOfGuW6xCIK7rqCOGIMVbXAInyHVfBB?=
 =?us-ascii?Q?0aFhgRq6kYT/U/MXDWUabuQ4lPBgcsJEhfnfXwOKqSQZPV8FRIT9iUQXIKzu?=
 =?us-ascii?Q?WV8s+/sQshHk6NCyDOYq3S0iTnNh0edlvMenG6fXZi0TPArFSH1i9FF6ddXt?=
 =?us-ascii?Q?ANcoytzeOQ+WvwI+o68apwHXZgs0fjaduH9qYFOt0plKBRnxy1AFW6HfRLS5?=
 =?us-ascii?Q?dbA0lm/8Gq0gJdHWbSv+kygx8HEK8zF1IUdh7RpXjmMeFackANgy2r95DvR/?=
 =?us-ascii?Q?KimvFQuW/HcZ/GLOd72itGfxu2KUYcFqVI+NeuLlJJHtkjrJ8Jm8mVudY+1q?=
 =?us-ascii?Q?pV8e0Ur493UxSwcOB6OiG3MCp/74vj17ZxkMByQn5vLDcw4XBCqmG2l2Y2KU?=
 =?us-ascii?Q?u17bof6QZ3pb97hIK59Qfhl0hi3NkSiEfz7+opRDx0flSatdYZc7zBfWUkbc?=
 =?us-ascii?Q?rhUxIUslq2ol0oYyOgl07jLXZiWgnz6JhC7xsJw5vGDrzfhDCEn64+VCZUgh?=
 =?us-ascii?Q?Ks8Cll3WUNp6vcC54blISr5MPI++XBPOmkK9tufkXL9nab2cr5n2U+Zpxju8?=
 =?us-ascii?Q?Zy2QsQl6x7xg09+nsmxWcq3ZtHGMN2LJCpYkQpVZRGh9YnvRx72jf9NWYk+w?=
 =?us-ascii?Q?3whtwurpbFSasICbcmFiBG0G/FPC+Gyn73Gk3S8D1jbGOyUnt7e9/zOsWo9f?=
 =?us-ascii?Q?hgdw0lUnAHV3gmPI6rOcAaBurBpLpT2bZqvgxTJvunaDOgxjCiTMtB3RkV2d?=
 =?us-ascii?Q?eZKRRwXkXxYdCzSDyfAL5FlH/69xNLjHij1y089v7SCQ8pkW7S80gb6dwFf5?=
 =?us-ascii?Q?OsQkA2H+bYMEuxmjGDRXuNApS2/D5NH0J6pNR29PZYzoAxqm1XUJg1wWQT4u?=
 =?us-ascii?Q?zk1tg6OKaakQUZL587dYBjaKKRDwQxkIJoGCjt84RKKzUwad7+kKZay8Ie+i?=
 =?us-ascii?Q?K7I9GwKK+qatgDT6gWfbU/EEbhqfPTcaf4gNIhe3rzJx4j4G2HIJRfZEB0xl?=
 =?us-ascii?Q?CA0MARuLHmOgZE5qxy/72B/CDsK5s8SBqEPbfUHAkvEiRfmz23McxakdVKR/?=
 =?us-ascii?Q?aWsVQZWeIRlDEIL6OnlPKNKLVY05fAzlrsGoCCi6KuB8K3mn+E2DEpl5G3fo?=
 =?us-ascii?Q?n5Sntf9pLYN9+04OEU2SRVcqy4ALrD5wRxF0kvjyh9veHjiGSTExAuwdLicn?=
 =?us-ascii?Q?vAtiQI+37qJ6cMvIC535ntkjh/44ruVZQGW6K/a6tdKKkiduw1wwzRutQfzz?=
 =?us-ascii?Q?Bk4ePiI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vE/TqDnhJMTQV+9NHw5EI2SuSykmpH8JXO29SZXlSr5W4DVCz/UIxHKwWtN3?=
 =?us-ascii?Q?Ls3xDTUB0vvstJqBLEG/FbNoYBZKGFwh7+ES7VReyRjw5E+VQCgIigRdicIu?=
 =?us-ascii?Q?Rr6s1jzPkRBW8CKLGfwqZ+DEAgqO8u8ABOZ8i/O0fxda3cnaEfJYYAFSROSn?=
 =?us-ascii?Q?9ZcnQLx0VbyujBH7+QuSsxOLUHwuLmqGx+jVnM7ps9aewZgTO6UPbunCLBtB?=
 =?us-ascii?Q?D78f15aK+gb08vKitgdtXkICsia4aVCZ5BCTo704W1zh/GrGADhsA7BHNVO2?=
 =?us-ascii?Q?46m4bD61VZyASG8u/ClGm77nlPo/CHbGPsPR+BsZQUYI3jRJLr9AuQkY6AL/?=
 =?us-ascii?Q?mo5mHoP8DnaXv0pOYiCJj6R/Anct1o6fBo8qlx48of3qBAApuoFqihTvIRkJ?=
 =?us-ascii?Q?7elWjNwGw9DbSkeHpNoNLjq9xd1zdGLVwEUEGrYzARDe11qkSImkllmL8srw?=
 =?us-ascii?Q?hWHFzG4377ry6+y9E/npiURv2G4+/j6LS6yVuHf6vrouDg7SxaTs2+0dnFt7?=
 =?us-ascii?Q?aUTRmmytr9//3NpcKkcoB6ISF8+Lrzapf5HnKi2SK+Sz7wPgTlF+68+YwQy5?=
 =?us-ascii?Q?CFq0B7s7MK8vR5ZWd3tjkntcuZ+L3v+koqoSCrouTbcfEE53EYCS5ZBuPK7e?=
 =?us-ascii?Q?gly0bho1CKM9F7P5OQ82kfiWZOcHyfTSjxbQP3/Nvcg0h6+D7mA2YbLya9zO?=
 =?us-ascii?Q?rJGGTVMbVSI8/SG9olIz8h0TSRgHAduCmUxigsq6bw8xfbloKKIZ+YLDR2Qa?=
 =?us-ascii?Q?SWZ6K7nZfUlwnEC3E7NzDT3TB3mVBOrk2q9OTCZHlizvWG6Y8QDJbaEaAaiw?=
 =?us-ascii?Q?wWF5R0U0ZhLrvh8p4xPG+wX/PCvdEJjVI5dttfLag+xDoF8Kg1C9CCW4/A7r?=
 =?us-ascii?Q?r4VYMO0tBV5dCSzM4Xo/EZ0ceQaa+egwoKuws8Lr9NMfHEwwiUYTX0URKqWz?=
 =?us-ascii?Q?PAj+XZvA3hbsE5Q5ztVS3QkBb0ciSuOEdX3Szox6woxW1mxvnhIKaZn9g2XL?=
 =?us-ascii?Q?ww61lZ4TL5iG7J2lUy1m9RJvMfQl2H80i/ZaM/31ZJvh64MFnY7fAmjky8oU?=
 =?us-ascii?Q?KmfKyrnBh4fLflazy8Y3f4jwsyLops+VfSIQnhPb3beGuTaPFrIhkSlMERcF?=
 =?us-ascii?Q?20w5j+dm67nj1VsCTUo8KXP1Oj8tXkTQdilnk6vfqmREgaME9AbLE9XESouQ?=
 =?us-ascii?Q?Ge/mQzmaYE9329h2obBHhfj/U7GwftbiHkoffnDKMPOA0STnCT26Y9W1ITBz?=
 =?us-ascii?Q?/3T7uD0R/XchiKtM9g3/p5tyP7AfuoySso63+SN+OUiiVRIEbMLRv6/+MFRN?=
 =?us-ascii?Q?vs9aQ+U2iEFHKWKSMAfPM1BBBj0Cb9lmDBVKq47VTbeBkLVoBTrNsdiiMtFa?=
 =?us-ascii?Q?SWdiJvbD+xbtc03OvQEoyBIP35/dNPOtgD+WJkipADQ2qhpWCYkvqJePkCAJ?=
 =?us-ascii?Q?l8m1r9m/vgthMXtXBU4AWBBRpq8NShcGVY6IJcb32R10fsxkPxZ19hdRPLMl?=
 =?us-ascii?Q?yWEYybkZ0Lp1h8LvJ3W0GHw+NqBxxOk4PBwd1oJCP0aYUeLzXVXgtG1que0Z?=
 =?us-ascii?Q?zVNzAE/MepmobOPYZ7TByEIqQ7acvI4A0JUFk5Iykn8QyKlwllUfn94+uGiy?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s/GYOoMrjZbZcTufW63P6pdqUZ6b3a6ibv9sqV8YcMcle2EE0tDK76312S15KiGl6o4gOAFeDVZrltPnvn8bx/X05lmuw/FSATVAZ1zHDOURSzPhsPhOtL0234hOy6f2xlqGjB9uVnGkj5h9EZmck71snSpV5S9QSDQbkxp7dPhcroph0m5BDhdb1UCjM6wzsB1eJQt7ZTgJ1AJaGQgt1YE8YuDI1UkdPDfgfrbbESBqxiTG2t7gEFihpimykZpbxYXCRrFVuoq81km+SAN9ugARn4j/ZZwwlQ6qhvPjzjmUUulQel4Z8jzsqVCZQcLIRPaSk1RGhKE4MBkH49ya5JjmdXAZgMpS/8/+IL2H8nuRuJzeZu5AbmYFDgpZItEcObHtqsA2zS1AZhfO5Zd4b7Z5urVktgoGh4Cmi/wz4+QZPLI3Cwpk93Z0xnBQCo3G7SnFU+CitAgM51HUor+9oSW69CT4q5BX5QybFw+xhPMccb3G8Iu2bHfy8rhETnlmtwPlzMlXz8cn7cbA/h1F18fLbZjWlUodKjIML5eF3VeU15nvkOZXF0wOmfTAzwiQRhRv8flp8ZucDBATqzVyVe7D5koDVagFxIWGH+f5jMI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fccd1a9-5f27-44fe-2974-08dd186ea5ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 16:29:26.8360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74taNiByMOFL558dU18g56lP+Of3jk93QUsV4g27HAmQSHGYNR/OZ+LKgaXnChUTGJcEgCYKSgxFS+ASX6itFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5135
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-09_12,2024-12-09_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412090128
X-Proofpoint-ORIG-GUID: 51ln8yrqZbtlyXY6OCKgIirLcyvfWMU6
X-Proofpoint-GUID: 51ln8yrqZbtlyXY6OCKgIirLcyvfWMU6

On 9 Dec 2024, Alan Maguire stated:

> On 06/12/2024 16:33, Kris Van Hees wrote:
>> On Fri, Dec 06, 2024 at 10:35:50AM +0000, Alan Maguire wrote:
>>> On 05/12/2024 19:42, Kris Van Hees wrote:
>>>> This provider provides access to all kprobe-based probes that are
>>>> available on the system.  This includes any compiler-generated
>>>> optimized variants of functions, named <func>.<suffix>.
>>>>
>>>
>>> This is great! Having a rawfbt allows users to still trace cases
>>> where fprobe can't currently handle.
>>>
>>> On the .suffix; I get that this is intended to be a raw provider, but
>>> would it be better for stability to expose these functions as "func"
>>> rather than "func.suffix"? It becomes difficult to write portable
>>> scripts when suffixes are included, because wildcarding
>>>
>>> rawfbt::func*:entry
>>>
>>> ...to catch both suffixed and non-suffixed variants may end up tracing
>>> func, func.suffix but also func2 etc.
>> 
>> The trouble is that exposing <func>.<suffix> as <func> will mean that you
>> automatically end up trying to probe *any* <func>.<suffix> whenever you
>> place a probe on <func> using rawfbt, which is not necessarily what you may
>> want.  And there would not be any way to avoid that.
>> 
>> But by not collapsing them, you have the ability to catch them all anyway,
>> if you want, by specifying <func>, <func>.* instead of <func>.
>
> I tried that with the rawfbt code but got:
>
> # dtrace -n 'rawfbt::xfs_cleanup_inode.*:entry {}'
> dtrace: description 'rawfbt::xfs_cleanup_inode.*:entry ' matched 1 probe
> ^C
>
> This matches xfs_cleanup_inode.isra.0, looks good so far. However:
>
> # dtrace -n
> 'rawfbt::xfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry {}'
> dtrace: invalid probe specifier
> rawfbt::xfs_cfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry
> {}: probe description rawfbt::xfs_cfs_cleanup_inode:entry does not match
> any probes
>
> So the absence of the non-suffixed function (which we included for
> portability) triggers the failure. So looks like it will be necessary to
> add -Z:
>
> # /sbin/dtrace -Zn
> 'rawfbt::xfs_cfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry {}'
> dtrace: description
> 'rawfbt::xfs_cfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry '
> matched 1 probe
>
> So I guess as long as we document this clearly for folks wanting to to
> use rawfbt to write portable scripts, it should be okay.

Agreed. Documented behaviour, trivial workaround, maybe can be improved
later -- maybe we shouldn't get a 'no probes' error unless *every probe*
in a probe list is unmatched? There are good reasons for both... maybe
we should add "foo & bar" and "foo | bar" and parens for precedence in
later releases, but this is huge overdesign :P

-- 
NULL && (void)
