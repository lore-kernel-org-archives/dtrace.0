Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF901C6BE
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 18:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749322033; cv=fail; b=O5G0rogwKhKcq6T0xvxKI/61NGbVs0Z9F9KjduAfZiWUG/U+63xizHMPWbYBbPB/xW8uMnGg+ml8NJyS5nPNcFD06d3VVpIy1+foGExtR/vKz4Bj825Wq8HEuUDR80rKcXXs6UbkV5BFTJAmw4sxX3637L5EvEeahetnXFXNORU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749322033; c=relaxed/simple;
	bh=5dRoV/5YSu15H2tKS0Bl6Q2uj3pikX7xdPQz9ndbKQw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=P/awgOIofhl5cfsXCH5bV1eZ7i/rTCbcNhCa9auEqY0u2w9jwBTtt29ZegvYGBfnWLStoufnbDSsZnqKiOLySPh80xuh6aa3axqzcxDoLudYwpnbszyFO/tXvoKPCXnHE3rfOqP1IOXu5sDKTULsKgbDs7TBVWumUmv8D7gL7Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ewzRWqjH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UbRknVRr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ewzRWqjH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UbRknVRr"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557DG0gv006537
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 18:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=XcqelrMqF97rHVlHDO
	XhCTfQ2GTtcuX+bVh3QoMx3IE=; b=ewzRWqjH5EDByinFZ+bXtNSoby40CbWNHQ
	9Si/SAfN9upaO2WSCTjupF5etSimC7fzTOMVqTbVd3uwKdpNAdjqIe2HiUXYaTLG
	xPTaBadfvnwcTbW1yKKvx2NkSIeGBzg/Wtpf/1NbZCOATxD3ZYTGyjZS1ShZErw5
	FvG9W5kZiBmyLXQ1lhP4dfH+5e7TV1QAIUntM9I1tD+Y6UP5s4buIhLX3WTiVbSr
	vvMFNiGBy/+2ZcP8tKz9ogOXfRAPYT/YQBrTaz8kbuycpwF/oa4j8jsVYBzUNejz
	dkhB/Il9F6qhd1vRHes8d80obX7vOIcShSaBGMTy2DyXW57p3oCA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbe8e9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 18:47:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557I70W1031370
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 18:47:10 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv65r37-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 18:47:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZQsrejPKjs+iYkoN3o8Nh5n93Jt97177sD5MO5Hn+9T4jVl8zn2wrf12H8Qszwz8q+YFnFjwu0jNZkQ5E+tJIkh3ClCm0Wta9UeIKlL4OxMe/9LkRAgy5v+pDFetfYUGftEyGA/yJu7NhN87esa7AXZgG5N7Z1PKpNYPQSxxGceIhsbAIO0CabxVHTyjdW1W88U/bf2JdSbDMvIA4ZcG4r7JnbRenan9AbT00qlNNHQUihCwfNn8WjjWAVK3WkkpIeMUMqvhv+nmfpkBB3A6vowTnhejd42wlV55gbS1r2rclv1YEdZ/kiKe0+pGJK3taCboMDbvFixbxlwZAhMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcqelrMqF97rHVlHDOXhCTfQ2GTtcuX+bVh3QoMx3IE=;
 b=BNIPtYfnm/Ujo/pxNThat/RUzFvVanKqw3HCW2mjV5Co6VHwyY7I6slcmuPfCPGrI0+KwUu5nPV+Y2qsv2CUKq7smdXKDLaR2maKz3W5vlPWnfPPRfH/h/yyz01uqSoyXKyz0npgiXCzv7/53yF6t96rwp+HidodWLWmwbAMmR6L5R5yCWwzLNgDhhNaZUSAEncV2XBtA5Ozn0rs0JXWC5DZhHdqX8MEmcRXs6PsQi8UmfoXYFgQPOemEzkdjWBCLbHz/KuqNsvmMVk5ugA72cTnrdnRI1DiKyZSLIJ+bpG5B2apO8YvtEmlGTia6tvp9UFukcZu+yuw0vY9UaS3NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcqelrMqF97rHVlHDOXhCTfQ2GTtcuX+bVh3QoMx3IE=;
 b=UbRknVRr1CrV+jsW89xCUS8dnr3kJKbkVF1deuCMnA+A6fGsv2YE1ueLoHdDDOWQ7qwMuwnwCT+l7dQEadyDE/R6uROXEuPEQwXwMTkv2E1pTgM9nDNTMYIDYrBZtcgAsUNQu+JlE/8MEduyB9XVYsehlyAF8VGU6+TBifWDXZg=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DM4PR10MB6205.namprd10.prod.outlook.com (2603:10b6:8:88::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Sat, 7 Jun 2025 18:47:02 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8746.041; Sat, 7 Jun 2025
 18:47:02 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 14/17] usdt: implement tracing USDT probes specified in
 ELF notes
References: <IA4PR10MB8374FB7BE674A6BF4DD48B75C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Emacs: there's a reason it comes with a built-in psychotherapist.
Date: Sat, 07 Jun 2025 19:46:55 +0100
In-Reply-To: <IA4PR10MB8374FB7BE674A6BF4DD48B75C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Sat, 07 Jun 2025 02:15:05 -0400")
Message-ID: <87msajjso0.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0645.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::16) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DM4PR10MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c86cd3-3338-4f7b-fa37-08dda5f3b0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lur/sug2gXAPGnLSt8Nzc/0YTzwAroTikA8ji8ehZl0zIa0bXkfuIBaoR63C?=
 =?us-ascii?Q?o+9UTH4yFQmy+O5QnT7mBTTZ3aKpCR/OI1TqTks4sRk59KrHwGJTa1UozT9n?=
 =?us-ascii?Q?fl266bPZx/V4M1EYq4E/VQb86L2rsUcN3OsAKsaHkwvq0uCCNaf4noecQrzc?=
 =?us-ascii?Q?OL33xvOHHMlS7D2f6nFarZqzTgCm3B3NyaTa5feNhrPO3WsyhLYU7aImGbpe?=
 =?us-ascii?Q?1hBORbmYcSkVGVLZmfSkMmDtkMdwhjH3kybm2MNIzG+nmbxUIa3DcUsHO7Rk?=
 =?us-ascii?Q?IvOxwEtHUUjsSPvFY9HyQjx9zLGh356KpMC9eoiGF0CCfdVWbXhGBSTWXb9m?=
 =?us-ascii?Q?m98zkRw3jtQGDTwjJ+AfkQj27V6h6G/vUXUItpLZmgFFcS/TAaAAOzOaNFLP?=
 =?us-ascii?Q?E+io/tZeT9MioP/VOqd9WGyqnONK7RDxvO/YvCuE0XBzoS76zv/6fkPkhHpc?=
 =?us-ascii?Q?09H+5/o0Qx8Ws8tLx/ApgOTXnvJyBnGP2Ry11j62cvL1qNvgKWIJIavgMCrq?=
 =?us-ascii?Q?5jsKZEWrha18asbmr689Sl3k41ASTL4m/z68fl8VRrlc0q4od5WVxTelesuJ?=
 =?us-ascii?Q?y8A00WhZKmHTg3PV61xnvL5VG7Waq5eHUyaQDVddTWZ80O1NhjDd7NxRCXJS?=
 =?us-ascii?Q?dq08KDkXcIPIftmLxAOsci1urYETOGB8f4/5Wsb0iMJpNvwm5hUbXdDxrtSI?=
 =?us-ascii?Q?myew1BgbkX2ghstt/Cd5NoPNPwPxeHzR7Bk4CYmPV7ZO8d+7GOtJEIyWEnlN?=
 =?us-ascii?Q?SCmPdJ3MPyxyxpOLz6gtSJDdSyyE9b74DpJMF7snYRzX7HQmBJu4LAPMJJNO?=
 =?us-ascii?Q?I7KXqkKSMbd7xFr+IlxCrXQ2Pl669eL9S4dBukuWOGvDq6my3bYy+9H3uxXS?=
 =?us-ascii?Q?X6mzev15mDFRTk21n82asoqKg6AyUWICTSx/E/NSCiv/kRxd0uF0vEm/ICpO?=
 =?us-ascii?Q?iXE43FUOP6m/pO4HOZQQUN2nXzXDyWAPcCQ+WsBRpkFRceFogZNhwsthRDhB?=
 =?us-ascii?Q?3L4anTo/RtmhRxHj9Iyv19SVuFizVBKxmF6+UbAmaotMqCVEaQooE1eo0JBr?=
 =?us-ascii?Q?0pzLJ8AOUTtH9rQAEyG1NSNgEZF4efL/Uy/ZEg8drPaOxzsFXTa4cjdrXk34?=
 =?us-ascii?Q?pRCtF+oGm0HjSTT521n5R8uPVePvCJqeB1CtGiEY3DMQkpfyVj+Sy2ywZTav?=
 =?us-ascii?Q?Z2lYhZ7UhelXvsyW0T1xrbtDtZNxnNBQVCL8Ms/umJKzmHLfk9XzzgBbyp2G?=
 =?us-ascii?Q?7IT6/7FloQ6bmofGTmoWoU1zLGDAn/v+AJbfajq3dpxIZnvaGaJnsm2wcwtG?=
 =?us-ascii?Q?3wPFDDULWKac5cOGyXSrQKgrk8iqs/nobaEGmoSMCxiykqkjqMgvT/qH2qjV?=
 =?us-ascii?Q?jPDh26sABoNjQ2+3Pxy+BMQGqPyQrmwMY/6q+bWpeE67xeRYHCRH83wcrDsg?=
 =?us-ascii?Q?iUrFOOl41Ug=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HHdydr15kRA8zUrh4zFs5lTxDQfj5MsIRrwK0xMJSQ9h4V3kn625OZ/IMI+h?=
 =?us-ascii?Q?/4b04R58qoPivj6x4/w3pc62dKxKjhKmfuys23iGECuar63xYaUZQLOA+o4j?=
 =?us-ascii?Q?MkV6kmlDDdJ0Chyrk9S087UbdoVhqPh2TvEs6+a9BMgMvnQOKP+n3bzvFEZl?=
 =?us-ascii?Q?rtnU3Q3t6zTlnbhl+Pe7sZeITe68x2lvhsWe2hU277QWZjSHPrVPW397Fnxu?=
 =?us-ascii?Q?e+sKaQPQHuKmi6SJt5w2BoykWFBf4HqOgmuS1a/rS3DvuY4xeKM0Gcv/syys?=
 =?us-ascii?Q?0M8x3kI89tTWPJUJr0OyzH8uD/aOjIedh2lDGkoQDwcjUgzGMDQhfqGn/e/T?=
 =?us-ascii?Q?2fxtXkrlmj8rCDhYHZdcdMFFkoEd6sYTruqbnAcs5HOI7qPSnMtewiqnSU5d?=
 =?us-ascii?Q?u9Q45+xUhtkYNrfHsYbhQ7r/Q5W6QFSkWhJ7K9o6rYqXxgNArHmGuA4FWgO5?=
 =?us-ascii?Q?7i+lMqLlyk2euunBrjvz3mUekEXDGDh7YW5BJprPhFNwuFdRBwUS+VkyqNv1?=
 =?us-ascii?Q?cI5DBKAoyYgLopHWgX344ZessxjtJ7IPunoDccLDVlDO6/gdjQeq9OhZ91Xx?=
 =?us-ascii?Q?dDxSVPKFrD+1BJ4aFv9DijZ3L2GJDoRiqWs6Ev+UTzriSbyavcDTyTfdfCB/?=
 =?us-ascii?Q?SPVO63Y7AfTCc1APL2GAQTSGiBXf6uWveVPdyffaZd5mlI9QJo7JMxNFYhjV?=
 =?us-ascii?Q?tnhE4L/sxag44ZUQcOxMxB/avKW7/nOoJsLXS2kzR8P2h1QxdHLeSlBA18y2?=
 =?us-ascii?Q?F2Yf9MDThVihxrCXqnTl/5r2iSbfTWjfQQEVDgP8zvK14aKsbiDnn4kJ46ME?=
 =?us-ascii?Q?q3C6z7v7stt/4nlOkI1+gt3DFx5X2e9tBau2FyG0vAXTGuMV/UWmgbMvffTy?=
 =?us-ascii?Q?4+NCAOnbTtzZpuVNHONUK6BWC7ro4WCDerkTLlUSIroaLLK2BBp87fBBm4Sc?=
 =?us-ascii?Q?geN6j7eLsgtFCFF1yijoCTT3g4IMBMK5m3ibMecc6gF6UuXYagO+Yid5/gys?=
 =?us-ascii?Q?+aU0wcKyrpwssao6rSd5jIibZ5tAvYIzas2hr1tFLmJhYLaIa804xitAvo1m?=
 =?us-ascii?Q?AWS0qkoZ+NvrYEahmSNr/BMhURlRzpjkYsFo4EN9OS1lKgg0IdAO3hRij5i+?=
 =?us-ascii?Q?r88BgRa/my/7945Rl3yzmoIW5fvaTAi73wzC/5IGemfvnqi3knQQAJ2V76Nt?=
 =?us-ascii?Q?KzoiXFrxxvU2JVqHcCJ+C5DqjGaaMSFuyP5K4hJxSN3aTK5fa20JlY48Tmnt?=
 =?us-ascii?Q?B6psxVwuPn5tAV2skrVXzeUZEW719uYAp45l6dMlRiAI2T8G7FqIryy+jn8+?=
 =?us-ascii?Q?b1HPwqqk2SKMBRPR1I1mqZ+Qbk6stzxPAu6tdMRPywabeEqVQ1xrEW01j9I8?=
 =?us-ascii?Q?v2osHbrsHe8pORQM5N7fpH0uB2F3jFvu7WWF9VCuUqB2UQvbGn9Ia2IgOP7z?=
 =?us-ascii?Q?AarIS4bj93S2/SFm3RxquMSXyyrQwFolIEijvRXH/t52qE+QFxb4M6yad23d?=
 =?us-ascii?Q?HfPQa+rxc9hVtRDs+OV96Kx/Cv/q+YPWOh7O+TYha38pmLrKyGEt/VwgIsYH?=
 =?us-ascii?Q?eOF+ExxxIWZslRKecq32bw4wMBXm8iF42woi+1haOIAZcZ7hAOB1YIgt3w3L?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oJk9234zqRm43ojvvRSjt8vlBeEEiN+hBwshYqkHdlTEFJQiGnJVVCODWtPIvFcxkuGsswpSqrE2TvyGGGAEieVX3iji5yjxy2pce8xOY9T2BjdIOpTFZ5d9uGkMeMoztb4CsTYe+6CirXeBXnSrhHARIR/AnqrWIBiKKNqRuEXyg9teSzpPZFRKRSgPgZddxP6xG+t1OQbSaFUkodiGCWx1gB1MJOqQtFjVvsASi6u6hvn9FztMZ60nYDpLJNLVFP48n81O/Vg7AAfXDltEjITx+LES1oevS6zBHOlfDFlS+BDdVGr15aznJfsKY5T8JFjvbLcZfxr+y5LmFTxbWtHr/vi/y4i4efH2YDUJfqFIVzdCV2yIqk5f+LczYtfyeIvL/UcAeLMlvwZeL4UetRkR9qQ792+Sj7xgQekWIWooSfCeqBg2k4lpffmSEvqpQFWpmB1ytBj7qOmNOzcgIhNyXi51qyn2LJpRyn1Gc4JmGmyxqPqr542iMdcTAxLgdYHeknljjGbBCMAJKVncg51jJjpGx+8Ue3Fb/ExKkdknjZnrw9HAmnyfQBRJLLKYbY4k42tP5tt34lGkAjzEaRTvUcAyVUvLPeWtBSrHsxc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c86cd3-3338-4f7b-fa37-08dda5f3b0ad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 18:47:02.0442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NUMQanrdwLFGW0joIGeQvBT7RsSbfSVss5uW94vUwW5a3WueTnjDpizbfREH3xnMVKk1pL45S/C5kEezwvH8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6205
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070136
X-Proofpoint-GUID: jXxon13vuO8szPlN1HcHAJ0olBHgmEkh
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6844892e cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=p1tvPcqKeZDhaSASUokA:9
X-Proofpoint-ORIG-GUID: jXxon13vuO8szPlN1HcHAJ0olBHgmEkh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEzNiBTYWx0ZWRfX/6ezvoMHpe7T qDzRJmML2037PPpr3TyvSOu8jB2DbR6Gy7z0BwGhxWsxe+LNiFh741YixMfYrKfoC5OMGKHNF4J 7UgU54o9WPjSuh60ojdLA+a9cA//ZCsy3fi3lbUGrKKB/o8bXVuRKG2fhYPf/5CKGvAmr0pFpD8
 mdEN0lnXmRxwbzyyzW8owRYAZ/7lZSKN5kY1O/Q34VXsP/aWiM8urGnKqLQdQ96BiIGLVl1RbL/ uROTjjJF705YgYAe+jGXTaeluH0BNNyoDZEiUuj+VX0GaSxiITMKifDwePJla40h7SbBz65jyUG s2MQHtW3Ed6dyq2uKh1cjYkyFrruIQDN/h7wXpAopObTYV7GwzikbAc2bKDA1Ax0CaCe3CJWf37
 JuutXBRUG2ZWLwrK15/abPrgzwVl26BbuhVxElEiSNBbaAt8yQ0UvoO86xLlAiMn1decCsF3

On 7 Jun 2025, Kris Van Hees said:

> ---
>  include/dtrace/pid.h       |   1 +
>  libdtrace/dt_cg.c          |   4 +-
>  libdtrace/dt_cg.h          |   3 +-
>  libdtrace/dt_pid.c         |   3 +
>  libdtrace/dt_prov_uprobe.c | 590 +++++++++++++++++++++++++++++++++++--
>  5 files changed, 573 insertions(+), 28 deletions(-)

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(though I already have changes planned, heh heh -- but this will do for
this release, and about 90% of it survives those changes anyway: it just
moves around a bit.)
