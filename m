Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4801C696
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466516; cv=fail; b=Mk0jLmTMhRVAiYcFpL49C1wFfvVoPwFNGCXLlW42UvsET4z/GxuwC3UM6du/T1pIU95zTkF/8JilAl1/j59vfZiCTlQJ4yvU/Q4Yt6hUnJtoOCwo80BVWxNM81Ul2LXs/OFhYhD+q4YYTaX45zu0l325L1iYsekwQxGPfm82/Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466516; c=relaxed/simple;
	bh=yJDzlHyGpbYcVRMyKJvpu62Gym0GWX79Owxq20f0Ln4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L8p8gmMvZS4CuLRI82CNfdNZZdEa8FOmgJvljqJV0xRt7fRT6qK5DROM39ogmeKhrhujGT+4S/aAQoWF5JkS4LQnvl/C0a9s0Y+rmkZt3xpIVol8+zvkcRSG4tI1gn+PikjhQFY5utkH3OyJJLuQnSaMBtanr7zlDV3ugT8F01A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JrsEl9Kz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tsnUnRUA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JrsEl9Kz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tsnUnRUA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMTcg006662
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=Zt+v4Dcs6ScpyT
	V3UlbzlzJr5VAITNxjH8tjGLa1v/M=; b=JrsEl9KzShSCwM2sX8qrk+WppbWsNm
	nF8BQi9cJZB0C3K5EBuBnO7fAkuCyR3HqNNbBcBUM5GraEoM6WFAD04F4AMQp83O
	SdiPaIJ2AVrXAPTIQXUqwmY34kJbn2s2J4lwFVindCkrh4c2HhNBgfdWSNfBtZ38
	ZpCx8VaxNss6TXwh0/h43uQvZ8i8cwMa9j2lPZAmAvQr/creMkoqouR0uvOR4zup
	zRYADLhySSmpxGp60+6xYN6p5+AWt7DDOBUbIhN4cZQcVR23h60NW9ic8OKErLH1
	kDqUFy/EjLBqf10GL0Iw5fS/LjAhKRUcqvZP07izvYII6/SXRMje02Fw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 400ttn8hy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3E6xI037042
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2afcxv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMHMiDW6pwoipxjJJEZIrVzCu6B+Q8t+vk46a4ROJFNrfKEb6lmJqLsD+oXEaw2bzDVKwcGJf39+oUExW+wbefHrBitzUVYFkNnqGIipBcaQI1Yn+gpW/NcuDzR679jaVkeZZxrrSSBnbrLIyv4SVJbm98zShfVpvG+WUn4HJ9xJ7nQz5msVtJ6rLxQTIy+KRIckGC+Dc2AU+nPFu8p0Sy4vaQAAFfZ8cUpvDY2DH1TF0V29I+oLvPtfe2iNSZzPaeHUBMHiWCBfVgfNtnn7wBgm4qFYWHoQTAezGOtq/hw5r+/fEekDqkiv1hcZ8t2Kjy+w4N/IDJs1BuKvSxAL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt+v4Dcs6ScpyTV3UlbzlzJr5VAITNxjH8tjGLa1v/M=;
 b=Dom3YNsj+o6Ud3qJQwMHWWcJuoqwC5QSNEDiYejwPFuusDhTPT8PluhBPdGUkn5g+r0+6V9DGWHc1MMX0sncdrF3o/XR0Rgs0HHxedqzVSEFrXfO9eR1k2UaDveAc+CBj4jtiqIthRty7WGqfCCFZEPzoquTu+757mNvdZnaNb45642sjIo9YhK88aCp+fkPRmA/rRWIbceTbXNuayDuAeZFHXiz1TcYzQuTY8iiA/ezGBUhkMZ6MJvj3EdWyWvFwz3GfdBkMzWcQEGPnpauE3D2Y1lOtd9jL7r7KF+7AfxVoDhtEkKw7o/tsqbF0n6hjWDWXu7yw7fIkBhbS/4+Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt+v4Dcs6ScpyTV3UlbzlzJr5VAITNxjH8tjGLa1v/M=;
 b=tsnUnRUAepzP4tgr4JSPmSb6X3Va9if6j6BuQR0LsmPCWRVtkGGKfonQySP+upHFpmNLUuDHcxg+ysW15goTiaquXQOIePYhsZsz0k/dOdQ8uY0QDUQLEcx1ffmNHNZdbFEM9tipsSji1+mBW/vH5f+IvzhQG5S5snFIWB8Z2Q4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 05:35:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:10 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 02/38] Move dt_spec_buf_data_t and dt_spec_buf_t into dt_consume.c
Date: Thu, 27 Jun 2024 01:34:19 -0400
Message-Id: <20240627053455.21567-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:a03:255::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 1edb7210-18d2-44e8-0672-08dc966ae914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?89ick7K56/iW2EzqNtaAOIFTRXR+6bKpv+91mD5QhUORc6tMQBVK90j2QW1a?=
 =?us-ascii?Q?5y7ka8RDomoIeScmCipKUiuo2yfe+ZAwsDMMQqiSANgQouKsL8vuvDKDoTrW?=
 =?us-ascii?Q?bgCgKoTdOS1BzbRonkgRcdf4JEAClDDPWq0weEf/sC6AMjWYoE7g80yvQV9f?=
 =?us-ascii?Q?NxaJUsh0pD36LYEcbBBt+wppsZKM3sF1uZ/BzowJiS5qLM+bAcgMWsUSisCh?=
 =?us-ascii?Q?N4iB9FCWhI59UzpOorU5Dh/3ImMnEkHy8sutUpwFppqwQeSLcdBnMvPTUKle?=
 =?us-ascii?Q?Dp++hhO/u7gpwcq3UaB5MN5s4JQPbRbXd1RLaYWl+fnQnYbAC29B/rfuBMCN?=
 =?us-ascii?Q?4VjXRjlYKVPDnZJ2dvepnzncs/kT0Ftvbmm+HpplBTtkk87rzG/pTu3RVYDT?=
 =?us-ascii?Q?mh4t3uztKURO0/Ye0R4JK9krsWFnjkid6TJeiabEJR2nYCJVpAddg8BIoDj+?=
 =?us-ascii?Q?fe2ZYWyOvaREP4QC9oEs1nz/bClFsXbBX84QolOS6MANz2Xi7zGAo+XIPg4F?=
 =?us-ascii?Q?Iyqw7E9u797wsTFByxtMxl/C7/SD13LqIQqKH5+V8jX6lV7c8EZqOi4PLFE8?=
 =?us-ascii?Q?lXJwEjIy7OHbhjf64QOMfCWPR2i6epl3XSVPajgl9SNB6rVVHEYvkfXO+gSK?=
 =?us-ascii?Q?h9d6fn/QbK9+VOlnB3qOvfv4p7gcvafbfu48Ic0mjBFtY/HIlV1tf8iEGNJ5?=
 =?us-ascii?Q?2ofgyn9gyuxiavTKCJGSm2KCcnlPWf3cwNV2D8HH/cOmY0VKGjmsgdcT2W+H?=
 =?us-ascii?Q?0Ww8nnLsL7+Ojn8h2HqFeKcb5Aja4F/87zfmQ2Pk0PRC/4QEjtgjKoQQjFW7?=
 =?us-ascii?Q?40hOJqeoLz7m6My1SrPSSVvt0XmBhflp4ECJAPx/TszeHoFenaGM3dh44iMO?=
 =?us-ascii?Q?4stYIYfWXZ8JMrhbDfJfDN403HmZPTC2wNjCO0UwiRX4nurLRvTf7U++8Gkq?=
 =?us-ascii?Q?inTWjynGnmLJHCs9tOS1PFYW35fTtzKSmiXYBpsLbvVesBuSOfWaJ/cAmQzX?=
 =?us-ascii?Q?IdQYhLicj1urBahMWzgmOJZ3mnsg18JhplJbfLLWnyujgdk+g2fg2AeycGcD?=
 =?us-ascii?Q?tDB8fR0RYEvpfZb4Z+34YWL1HZhCmnD6ZPo9tUtWYgp57OuAoWmhOx6QBC35?=
 =?us-ascii?Q?r48unP6WorHeWhUyVwPvSaCNiV93wObRxkVlLcXwNLLrn/cgbqWR/1Q5mH/I?=
 =?us-ascii?Q?cuD3AU4+LRqbfAvgZsh4ref0LrOfrfevbf8LCaTFKLyhHkQlPmEdc26iBxie?=
 =?us-ascii?Q?8NXT48GITRlC7RqcTUWL5QStubn61YxPjgJg5KTAArhpD8jvl0uA5wDTGxgA?=
 =?us-ascii?Q?syWK4jop/mAhxIPjYyEn6v9Q?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PbcJubHONU+pnYyTtLVFb5/t7YK4n8UFAWwVL+XfxSgFHDRT/3zOrFFyMMbn?=
 =?us-ascii?Q?ELwuepGTTsbEqYxbqUhTbci+3nbOG1Bbl/N74aHB+iGSml50GiQcJYrh0gUS?=
 =?us-ascii?Q?7bryY/jGTtZimdiiakNxKy0fOhwFySPIKWM3KVhunjpno9S0T4o8DCT5OdeI?=
 =?us-ascii?Q?01ViEUqfiZlm8cL7tQt7i9/oeBzZNT4cgYKY3QAXrX+SrMjs3XNTC32hBE9O?=
 =?us-ascii?Q?olHoYWzQkOd2VNrQibbjWhqRZfCHpoSkpuK3es2bYRC+fkrkErD7gXEMTpG0?=
 =?us-ascii?Q?vUkpa8xOg5+qvVdxIR877g+ffbjfEWWHc2f/AmY1OIMe5FzuSzSnZxsNClPB?=
 =?us-ascii?Q?gkzdqm9HMQpwgXroDVgXz251OXWjhXI9l/3HIysKdLrhD/LFqw7wOlzhgdiX?=
 =?us-ascii?Q?YNpZ1PuYhCyRHcbBgDaoKrRvPt3tcVJks1xu8D9p6BIpm1SfqovFpO/c892x?=
 =?us-ascii?Q?Sq7KOpN9Q8dmeNQyq/WYyfrSweDfsC8U6NCgykD3k4MGxwuxIdwHZvvlJdvy?=
 =?us-ascii?Q?H4DbXmgQfyYGxd3xIgkytUbSD4GmTf7fTAerDlKhzA5LzHBAbqJPvtI9vtAi?=
 =?us-ascii?Q?XMGE+7GjwEsdvzOAp3ebb9vDoZTocA0Zd3jf05TAQMqSPglyrghfDH8qOfo9?=
 =?us-ascii?Q?db4Ph0R6iakZAbj4sDVfrI68DGJ7Hiupgdh10MN2z+8IiVUeSTdeQg8P83A3?=
 =?us-ascii?Q?DoYLkolEssrbXlcXzUV2ez8i9TF+Ap78HvZRbejjKde0oRZoQ8MT6PdC7b6s?=
 =?us-ascii?Q?Vv+KsJsR0n+IXX+ZsZDB0DRmREMLE8dNl3A6K6r/KG7M9fECWNFnC5JMq8/H?=
 =?us-ascii?Q?AqGkPH3/TR0yl2sIg+KS0FhHzhXOtqhODQfqfICHImmVft+sQyp1Cd1iLRBg?=
 =?us-ascii?Q?rrf/RCnXJI4+fpaOpzGytIEcH47nWk0yLqH2gYVnnzKRRTyZqMU+v8io6z1w?=
 =?us-ascii?Q?H+IsH6so5n4J1ELE1xVBQYT/G7CHVgNljF0t0tEWCzczm8o5l104t/8WdukN?=
 =?us-ascii?Q?WV15qkjfDWWZeVEpXZrmgOC4vpfWFJS9CVU9k1l/o2LJcwET49fkZ0qCoWW6?=
 =?us-ascii?Q?g/Z2o+WIEG4NO42WBU0UR37sqLM9xe+DHv3QMwIwqRwrPZOIP9hvqZs11Sb5?=
 =?us-ascii?Q?S/aORjuj5T/yGIsT3JWp2AlxCrXvnSNV/CK3flVP/m8zj8KvxuUxVFmLWzDz?=
 =?us-ascii?Q?wECiT8YH0heC8AxP6131obFWdXiI4ngC/w91231/mj7V9EuAlUplS29pTrN+?=
 =?us-ascii?Q?8aDqu/8PYzuXr3K5qB9OMUAjnRL+qeiKn5mEhmlTVlLBmS0jMG/Bpdl4Vt2m?=
 =?us-ascii?Q?d8a1uNXi6LQtUHiyjYwcqP0ZPMcEaZKNFtbJ2F3XZfCU+FApim1NcT4okcOV?=
 =?us-ascii?Q?RRVKNy5pjYap2wUw0F5ld5ch1RBXk3kJZL5M3IpU0tTlyCratG9FfqKJEm7+?=
 =?us-ascii?Q?oA0wdOA7J7GqEgqtl3om0AMlHflsxnrq7SSYoVjpUuD8XPNAgC/95OBRrF+l?=
 =?us-ascii?Q?T5EtFIFXhxNe76+/yoirOUTcodvehqgmDQYR91FlxK+vJizqV0+1DGEalbQG?=
 =?us-ascii?Q?Fmub3ZDABDBn3CC3V5yD9W38MGkW0bpYmEoQAwxB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1do07wRn4DKb2xU9CLQFSMqT8zg1TKDwMPbbhMATJH5YckmVBM0DnOT3bQKls/UxRjCW4hLZ7evpMevl+ydpPDzF2ctLGtIaoYd/GNsgwcI8kvlpOmIVsBHN95g64NKlstdHutnHmMpH4XRjChrDKHhSQV1JzqyATx7LYRA0VhDR3vIxu8NMeVx0JYQltObV3F1whMqqIsusMQvjsSov+D4sWYVHgKCo5DJOKYzzYOAuhByKwuh6EYNTNt+8ERB9kKEM+lRGIm1xUJ5Vls9cFxThHNgQB2XEgInFou1dXsY0mJibs7RkSfCIDgV5deqamEkLOLeeQQfl8uZGzgxPEn/zYlJ3kDFP1wGhrL9gP+bAcfayAhlbUwNBjACDaLG+JYwF8t6acAIiFWW2ZMs1afSz24NtH+nVfkvrMjQa7X4PwTINCxaTrwdHLtus9CFY0iH9hSB/BuXDT9sW13H1e4/ardEY3eEU/4VEy6h1kGbv0zeEhO1sBhLgIh4Y08A3/kO06s1kS6GPQTqva3H8eXDYjAQT77lJipVre6gLS6zE6eIpSvDvyKXqLmKIZSYUC3qbHDjSU6j1Gt91yN9cY27GWJaB8tInptaobd2yQwE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1edb7210-18d2-44e8-0672-08dc966ae914
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:10.1558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARPw9MIJmKr5wkFBe5YwDnuqfiw+RA7b4AOtmAkMjoh444JPxZLyu0XIjOFi1bGAzcClHUuj2aI51SOpDic93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-GUID: xX0DWk0SdGwfgmRI0dgs-pwhyenPk0dU
X-Proofpoint-ORIG-GUID: xX0DWk0SdGwfgmRI0dgs-pwhyenPk0dU

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_consume.c | 18 ++++++++++++++++++
 libdtrace/dt_impl.h    | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index dec2314b..5fb636fe 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -27,6 +27,24 @@
 
 #define	DT_MASK_LO 0x00000000FFFFFFFFULL
 
+typedef struct dt_spec_buf_data {
+	dt_list_t dsbd_list;		/* linked-list forward/back pointers */
+	unsigned int dsbd_cpu;		/* cpu for data */
+	char *dsbd_data;		/* data for later processing */
+	uint32_t dsbd_size;		/* size of data */
+} dt_spec_buf_data_t;
+
+typedef struct dt_spec_buf {
+	dtrace_hdl_t *dtsb_dtp;		/* backpointer to the dtrace instance */
+	int32_t dtsb_id;		/* speculation ID */
+	size_t dtsb_size;		/* size of all buffers in this spec */
+	int dtsb_committing;		/* when draining, nonzero if commit */
+	dt_bpf_specs_t dtsb_spec;	/* bpf-side specs record for this spec
+					   (buffer read/write counts).  */
+	dt_list_t dtsb_dsbd_list;	/* list of dt_spec_bufs */
+	struct dt_hentry dtsb_he;	/* htab links */
+} dt_spec_buf_t;
+
 /*
  * We declare this here because (1) we need it and (2) we want to avoid a
  * dependency on libm in libdtrace.
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 01313ff3..b5408c1c 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -269,24 +269,6 @@ typedef struct dt_lib_depend {
 	dt_list_t dtld_dependents;	/* linked-list of lib dependents */
 } dt_lib_depend_t;
 
-typedef struct dt_spec_buf_data {
-	dt_list_t dsbd_list;		/* linked-list forward/back pointers */
-	unsigned int dsbd_cpu;		/* cpu for data */
-	char *dsbd_data;		/* data for later processing */
-	uint32_t dsbd_size;		/* size of data */
-} dt_spec_buf_data_t;
-
-typedef struct dt_spec_buf {
-	dtrace_hdl_t *dtsb_dtp;		/* backpointer to the dtrace instance */
-	int32_t dtsb_id;		/* speculation ID */
-	size_t dtsb_size;		/* size of all buffers in this spec */
-	int dtsb_committing;		/* when draining, nonzero if commit */
-	dt_bpf_specs_t dtsb_spec;	/* bpf-side specs record for this spec
-					   (buffer read/write counts).  */
-	dt_list_t dtsb_dsbd_list;	/* list of dt_spec_bufs */
-	struct dt_hentry dtsb_he;	/* htab links */
-} dt_spec_buf_t;
-
 typedef struct dt_percpu_drops {
 	uint64_t	buf;		/* principal buffer drops */
 	uint64_t	agg;		/* aggregate buffer drops */
-- 
2.18.4

