Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B56026ADC
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 21:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770152622; cv=fail; b=JX8fJ4wmaBzNl0zxT424HZhcmnbdbmHfQ/GB8GllUMrNxTDpYw6t8Z3dydF9eVMniatA9R1n6mK/pcjEvt+kU9gdbyOELn3UTqQe8TY8JOSA8VsJOH2kYusOFQ1OfVZ/7hZTjYsVxju8oudqNX+8WbrxYXImwV/HEz+zTzTkbpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770152622; c=relaxed/simple;
	bh=WthkmqW0HDiWQeT4ZLxQu8uwBJE7ytv/lk7lLzNzMKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c8tOdQt50cXjhOWMPN2AGmetU+Z2SyyRU+YHJjttxlyRhkrK4FNpZyutWxr3G38nAcvAedg5eJvco5zFiRC9KxfZeBV35aDKt31FXtNZy086EEsmwRUfVagrRYPFGSU/cHFl+EP6r9Dj7sNUKgn3eo2IbdsMXS0KaSmihgM5klc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UW7zVVQE; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rZFOtLv/ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UW7zVVQE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rZFOtLv/"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuZDm1423760
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 21:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Iy3xySGj0A47pFkFJrjT3LEeNQ7g5Z865HqDXlba8fY=; b=
	UW7zVVQET5OQplJsc355BskukofplyhKuD8a8A1Vm5ws5qulWb90SsAn9Zda7nBn
	BCZR1MoR4kUo01bxsgXcvBdJiAqpxkn4xWqZQ68Pm0C87rHidc/P7ytUZfoj4uK/
	nWQOsgAv+sP6p/XX9EBUx2dhdoogRBLaCe/CvRY0omX/k5Hie1FM9ItUSJp9okUx
	SdSR3yubbizoJUiFVhspvcwsx9Dx4S3xXgUiJfxhPA+kQ5joHilLT0yJ0WgdY/wU
	0zb/VLsJGndV02VktMQo68dW2VUmR0KHkiIWXnkgdvNRaI2zUWwd//Y8Sdy7xJlW
	c6fncRv8uCWhY9uDru60YQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3jsqgra9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 21:03:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613L3b82002078
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 21:03:38 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186mxh9n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 21:03:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLGm8xuCy5uKTYITXFZpjHX7ikX8sovE0w0v7MGPG1L+NPyl2Dp7NkNNC9HJTnxRt2xPCwsbVZcb7uVmDvDXaJaJLX8RwlBmJ+CJxISvv74Shbq7XPqpvasG5PC61CnXefN6IdCLHB+YHTjKOTTrHIBzgluPY3L0CUXscONFvVvjkzQqTuHEmE6VgxFnUzJG8anqYM011e7RD5iN3gXUIJWVmAyCOBNY6TZ7yRd2wGxgOUQ9vI5OPHADtKFC8yy30wd9IHhysceY1VNN/B3KlMGmPz78Dt0gyP4eMl866bp6VSh2vG0X62syooeGPxsdmktdy1QEJbTTuFU49KbvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a23NN2e7C5kb2qdY08y7739pImdwhVh0MGAtVXMSLzU=;
 b=gbAfezxzwUWbjPHG1+AaxyOnZpzU3LvlhLE/tSRjRP8bZ8kwa6vt0HoFMmsX8APwjO3HESDo5PV+tHiioLUUzByqVqdXRac2uJl1EifiVIfEEibWdf5Nu+jr4YC4S3ojpdneRs46cIfFoc6n6ioMv1DoB3PTbM9RHYlBI4Mg8LGGkFtsO0Vt8R6aBCCdQsdcA8SldP09YFCoeNwJ7Ni0imsYCWUWmPZ/oNI483yIEE0plBrqyejYbm35ZFlLtY2p98Ub1HqjK7hrj3drC8eXls0YUiRovEAicnXRzVewdcJyTsx+9jQE1VJ1YXqyK6qqc5HCqygEDwWa44+ekplUZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a23NN2e7C5kb2qdY08y7739pImdwhVh0MGAtVXMSLzU=;
 b=rZFOtLv//N1YgccejJE1CFrUR4dglEv4krTJhlp9VRQ2/bY20VaUOyoAa8MLAkPc0aNXkXOGYQLoZQOlXb9xQkFDWoXB0Oz3AFb9qiP6inX3otm/4OEkoRxtvkV0tgB9yR4Bs7aCMwTqsLYTLRnuufqbaXhdkLbjyv7zcO+9NTg=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BN0PR10MB5189.namprd10.prod.outlook.com (2603:10b6:408:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 21:03:09 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 21:03:09 +0000
Date: Tue, 3 Feb 2026 16:03:07 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: account for member name change in
 mm_struct
Message-ID: <aYJii0z2t9FrFSJF@oracle.com>
References: <DS0PR10MB7522C34E1C6FA098104E192CC29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <08203c21-d9fa-99a1-1b4c-b0f1bf794c99@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08203c21-d9fa-99a1-1b4c-b0f1bf794c99@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BN0PR10MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 91361951-f9c7-4210-ad0e-08de6367a29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?1A5Qe8HgsoEHlPVBxgcUb1C+4bT4OfW13ld3p4qoRWHXux/qt99Ny6pcXP?=
 =?iso-8859-1?Q?/j57JiFw6LdW3XwPxm+C24TbXDJg7swSdjZJ/BuGlI2nZvrUSmc9q8K17a?=
 =?iso-8859-1?Q?OLqTh5WUZdcZf7x3EG/HWBC68C1KZHcayBww88iAi3JtpqtD1qRD4/4t5B?=
 =?iso-8859-1?Q?sJqXZqvoCjmoiSxPgWddyU7/cGupvKgrwLTq587z7B5mBUHMSnqYqO77M5?=
 =?iso-8859-1?Q?XGFs3u1sV008dWzsCHxDzBfsau73AZ3KnCyHU79PWzaRAhttgaLeCnu/d/?=
 =?iso-8859-1?Q?/uB3ah6vhIEXIvMuK674539xksVH0LhFsAN4K5JyaldVOdksZF30JF8lbI?=
 =?iso-8859-1?Q?mMRyY84qit999+HPK9GfqhQg7v6LHVLCVMbuqo809lZDptrNzIaQmfTlpI?=
 =?iso-8859-1?Q?+sTx8O+Iq5lYesVN7XGgYfvL1KTn6SKvEK6Wq/GGhffeuG1+dc2u9EhJXn?=
 =?iso-8859-1?Q?6D4Wg95dkfPbRk8CNY5e/0wxmE2gDsBQXyRMBB1WhL6goy5FeXiXuYzSY2?=
 =?iso-8859-1?Q?5qK7xY7EWklmLrVE5faFIdpbrkxUUs7wiNefIcvi2/STyawJ6nYmGf5ZYi?=
 =?iso-8859-1?Q?0dQ6R9r1Zyz6FeY6oeeAGzgICRawe45GCTUSrwxE2saoY/6OQijSCShFPL?=
 =?iso-8859-1?Q?gsjkiJZH+q9qZ/AWWJAe9JFLPtJb/fA8S37FhQbUZYMROQBTC6aJQq7PnK?=
 =?iso-8859-1?Q?3yuupaAPozy6bddwI5717dnQdSy9xnuH+LVx4IBMUhSC309JWWBS5oZ14C?=
 =?iso-8859-1?Q?mxNpxX1PS5NoTgKLcqbaA3FEZLApAMxQ4jzMLdtAxHnW3ZCW+cUfu6S2Zz?=
 =?iso-8859-1?Q?AD+tlUdaeOzo2spnco1UHGSCXjabLBoVLGnY9rjjNR8JwKyA084451VgKG?=
 =?iso-8859-1?Q?CbaQ51Y86TlSsnXC8MXUwsDWtC8HiBW5j0rbgLdMAhSH4ov99fkX4HyruU?=
 =?iso-8859-1?Q?sNDV8BmIWV5st87ZQZYzAC6dRIdxxbKyXLSEisGmQRw1DOJIHAJA9bbLKF?=
 =?iso-8859-1?Q?AQLxoWsAHFPqYaG+ENW8pMGV7CN3Y8oWv34bGhmEifnufilkXysWePZFJM?=
 =?iso-8859-1?Q?6oDfbgAkVwzRH/Tjotg3h5Cos7Oj++x8IYMfOgfFZM9XQDQu0AKpgOvtSK?=
 =?iso-8859-1?Q?bPZsah6vpxUKG1ucHjdSwleC0xYXPtVRKCyrBADsAIeJpilmxLnqB1HnB4?=
 =?iso-8859-1?Q?2h/DDVLiQpOj0F5+odOmzHJ6W5AijtJgi6Ub3oD1KPjiQgnpfZRKCGQRQU?=
 =?iso-8859-1?Q?Y2Xt9IvfUzRVYx34CZlMe94GZVNJRpe58C0ABwMWNxvERoUMBd56DkidWZ?=
 =?iso-8859-1?Q?zc1SL/vnoKhwoWnbdao7VP0tkkWuy22/FtIpMqEhTHe5bk9YsuqFBg8QcC?=
 =?iso-8859-1?Q?Cf3d26gMeQH5DOJJ2BcpRxMGx6n7FsPn/6YY9A1gJD9WsjGEeL3x06865s?=
 =?iso-8859-1?Q?eUYnnG1EkjvAafB8xv38OAAnVra2fbgImGoQnlj5e1ZcZP7lks/JchlDIJ?=
 =?iso-8859-1?Q?F4lhYQHGbU0jUzJn56ffH+HgDkqHMmwBM+UiYzeSNz2KX/kpVjaIKJ5J+U?=
 =?iso-8859-1?Q?UydNZTzCEc5PGwELeqkwZPliPYKhYxqRYFSkyGYWXfj/99hS1+3XN7S+uM?=
 =?iso-8859-1?Q?Ui94o/CrIFy5tz/X7+W/Sl1vVhH4EmYuB/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?9Yj+r3D+iXf3Yhs77huxCcPdKueZe9SrSIhbaZIqbQruyhH68i0dOsUhd5?=
 =?iso-8859-1?Q?p65b4nOcnd99YHGk+MaSvnOtrz+/EYuCQ275734Kr1ANAvtTHu7A0wnwdc?=
 =?iso-8859-1?Q?ztbThYVQbmcI9Hz+HZtX2K5Bd4os93wfMqwTOBjho4pte4FOcgEpbP1D5M?=
 =?iso-8859-1?Q?YAa3M8HuPofkLzQDNRXWpVTNHzE9NpE0HYOAgcfTrq9FqsvLIIVZLhHqyR?=
 =?iso-8859-1?Q?1hNfGj68BrW1G9iMEw5mYtzmWc992pJNEZnopiUNwFmzTrF66tEbDwJHXY?=
 =?iso-8859-1?Q?L+ULL6yygGb+dijAKPnoU2nbXVyiLxpYWM8UpSQWmYu5BvHAeotcx9Kbma?=
 =?iso-8859-1?Q?EcbBhnqGd36XU/JWYkAjI3d9DPg+tLGiyMgY67Zk4ZxfFTYIyPiqUTkyou?=
 =?iso-8859-1?Q?4T7b9JwDHoQsW/myujXFqHdNGzYjYVMdbBjLQAmwINY5C/ld+5O062x4Hy?=
 =?iso-8859-1?Q?SbbuHG1n3JqzLm5gEJFAxI8g91SIPfnP46kYxrGt6YDtijALhCCAIPghjc?=
 =?iso-8859-1?Q?J8RdYBYwk62M5OCp7iy3GIk0cx2prgrHQbLjqOVBOV+tchmw0p8+zmNFcU?=
 =?iso-8859-1?Q?KQi3NVclavPbJSeT7Q7/apTz9Xo7GLmmoDoqUcrmwgicb06xJg4zXyjZ+D?=
 =?iso-8859-1?Q?6h03xBUWiT3tWmayA/HAQ3g+xqtTw27jWLCqll9nZYQUDR7al4qD3nud40?=
 =?iso-8859-1?Q?OS+NhmJ5ED8i3U1F45DZl8Zu9iqxmY1186ehQ/D3MkkwgYM2GerIA1BJ6B?=
 =?iso-8859-1?Q?1L0XXwIK5pbz90ts3RNpglcTI7eissYzdANyj3KP23hSCZKIBa4HVAM3Bd?=
 =?iso-8859-1?Q?4yAMo3kqtiw+Z43WLSh8Yp450Krs9Ymxdb/R6rfznbANqwjpPx5lycMQBz?=
 =?iso-8859-1?Q?mfc/+uGdiHzGkNJUr8EJ6AMLrAVT/JkLIMA5jANT2fHIOnB+XinGQjD0Hr?=
 =?iso-8859-1?Q?nuVqTJ0kLm5B4QVZzcHsy6A9KfVr+NBP7L8xK3+iIqEG6kOFu0IsDCCWDw?=
 =?iso-8859-1?Q?acD7bGnPfrt72oWn/vVPmPZEihodV8MMfH5EnlYcWqvG5zrusO3LouCh0i?=
 =?iso-8859-1?Q?NwxMO4J44a6V9B3Eh6ehvZk/ZFW03B0QIWJzeIjreLwl1qcd8zKZ73laBe?=
 =?iso-8859-1?Q?EQleLvKO05YrlUKCl1Mn0Ent1ueGspw7xFjZFUPTlhtEwULjb8NTC1JJmB?=
 =?iso-8859-1?Q?Xj4RET2lYG5yEm286g/nq5bZbcdY75Yi0rjC6LWlUj0MekDLTjGy7weMDV?=
 =?iso-8859-1?Q?DMWBpZGP0vFVdiBrfcNguehNnCOpmdJQ9QNJS0u8fGumdgVrUie4xkeLIz?=
 =?iso-8859-1?Q?ckiSjdUyMSRebqCuEyH3Hgpknktoiua/YC4nLo20d+snIIc7MnGfPJbpfd?=
 =?iso-8859-1?Q?e9jq3RUKwzoT1Jwuns090fZJzyo6NE7lkxJ36AvXFBCYwIubMFjC1SwIRX?=
 =?iso-8859-1?Q?ksaIG20ZG7WQ02RKJ9PPk8eXcjgSSAzTT0ukYSKYOxDCj9e4bx6tOe5YRM?=
 =?iso-8859-1?Q?spjHViCJH42wOfty4FvY/JC4JrxyTh/gwbCqm9P+QH3PKBw1NeO4kkYRvo?=
 =?iso-8859-1?Q?oTnArPYYHudaY1pVv08F+9Q+SYDDB4nXuUSr22zhaHTJX3CqF6k0JpauUW?=
 =?iso-8859-1?Q?1YK3zMo6sRQcW47SvufLR1wFGnG/Xj79Nx3ycuDFpQ3Nz7NkssYeAeyE3r?=
 =?iso-8859-1?Q?7SBkxVeBXqaypf9qxQkkFLrVglLMljtHjwAw1FrIcArTru9EUpOenu+juF?=
 =?iso-8859-1?Q?Nz2F9zoI8GZC5xYrc4gIL8pCkkU4csIvGWFvVT1o2GnCpUMgtoYXbpvEiA?=
 =?iso-8859-1?Q?BceZgpQF1Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	erSncCxadTueV51QjVxzQQIdofEnKBtxbN7uOycvbUHcSCwMZgknQ8y9cor7hdD7Qz5wfqu7sdu6YjEhFrp76ZgeonJcTzQx7BTgU9Ky+2JUzd8L+lpy+t4yYMaN7pndR7bMdPUxU33hiuTp7hUie7wRgxwyHfM4xgOex3nPw/a9KDMXuLfuJhXcMJBR1/Ex6mVO7QX0E5pLJ7dr+BuyrcJpqLwccWC7GVvUCUiArAh1pxpScgD6K1KErekd6FE8nHxz5FWdF9eOsvaf/QvFKgKTy1YTapf3GuyjgnDwAJJ25fnAvmB0DUNmwrWCP3Fm+KwhXMveWWkExns7k4NKdV6nrjL3Ez0N9KHXd1TuOyHAcNIzY5VPY3F46LwY2bjHJcbyqDIjBQPcMEv3YkU9c9pJsP/isx+CaYCQkg22vNwLbKIz2vRlra3H3lyrTscXOJ7cvad/NmzATVAP1pzCPt1lp8iZhSmTir4b+/kllPe0zv0UC3poyURyPHfNpeLP8zq6dwXr5yx+ve81L3OPaUTtoO9LlZ7aNy54ZwojHnGt12eG9aP2BbGM4FEOBUMTF0QK6THOyz2kNXzh9zrSXux8GtlSwLZmNVvS3u8EN24=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91361951-f9c7-4210-ad0e-08de6367a29e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 21:03:09.6385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4+U/BJ6W0PHn1xEC1HskCHMXmXu+chi3FKD99qiP+YaCpjEknYMuhHLMBzT0POa4Y4gJJY3dmpGIcPQ9Zq8e2cmMmBjXQnxN00Vis36Hms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5189
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030167
X-Authority-Analysis: v=2.4 cv=Db0aa/tW c=1 sm=1 tr=0 ts=698262aa b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=_mgiuOXMKetIhr_xkogA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:12104
X-Proofpoint-ORIG-GUID: GZqdqfTXx4aR0EgIjOitXuWQ20e-GGje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE2NyBTYWx0ZWRfXwXRHk9A+IRRn
 Z+tI4vmHVe+zuxUZzUuXXRx575jk7zJ7gPwvlXCDpa6v0ns6tVwcTMmBa0bV7Cvgoo0ZIkCtqvA
 NcbZI8JlZbclEeUg6OVXUg/PzcZ4iaMw24Ffuh23l5CyK6jg1UqkFhyjqQG6uHuD+GkF9tySc2S
 a7yEQqzTNORHD3lcQDFELiwoiVbjuyEC+SBpLJNW+SvvVq6iIwUK5ptZ+zM4a/78CnJPL2iN6tv
 cYBx6RdIURpWlu5VvOLJwlzzbEYyQxTToIwVEoZVJyKMTlBy+8ClQIXthciQp8OxT9gpjh85WdR
 2hLg/xDDIRZov5UFkTu0iHAsdxU4hnZt+2XkY0Y1k6MuCzzqzvSgBnuWAnYJ8ptmN37L7Msp70Y
 BpGv8SjHHGMnfWorMuVKlldgynzueqidyT+0cjZtqrblNZMPkFfcGX8w5TxXvPI7yJSj4DaU/Gu
 uL0RT1k6UUZhrkjqEfHNRj4A+ogEH68QoQHr4d5g=
X-Proofpoint-GUID: GZqdqfTXx4aR0EgIjOitXuWQ20e-GGje

On Tue, Feb 03, 2026 at 03:41:52PM -0500, Eugene Loh wrote:
> I'm curious, does this introduce a new dependency on bpftool that should be
> reflected in the .spec file, or can we take it for granted that bpftool will
> be there?

Hm, yes, that should be listed as a new dependency.  Thanks.

> The "new" .d file needs an updated copyright year.

Thanks.

> Is it possible that both .x files "fail"?  For some bad reason, I don't know
> what.  I guess I would have imagined turning the .d test into a .sh test
> that checks for a member name, then chooses it or else the alternative, then
> runs the script.  So the test would have to run, one way or the other.

Yes, that is possible if they rename it yet again to something different.  I
can change the test to be a .sh to avoid that yes.  I was hoping not having
to do that because they are always a bit more cumbersome but here it does make
sense.

> On 2/3/26 11:23, Kris Van Hees via DTrace-devel wrote:
> > mm_struct->cpu_bitmap has been renamed mm_struct->flexible_array
> > 
> > Add support for both variants.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   ....d => tst.ctf-dynsized-bounds-runtime-1.d} |  0
> >   .../tst.ctf-dynsized-bounds-runtime-1.x       | 17 +++++++++++++
> >   .../tst.ctf-dynsized-bounds-runtime-2.d       | 25 +++++++++++++++++++
> >   .../tst.ctf-dynsized-bounds-runtime-2.x       | 17 +++++++++++++
> >   4 files changed, 59 insertions(+)
> >   rename test/unittest/arrays/{tst.ctf-dynsized-bounds-runtime.d => tst.ctf-dynsized-bounds-runtime-1.d} (100%)
> >   create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x
> >   create mode 100644 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d
> >   create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x
> > 
> > diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.d
> > similarity index 100%
> > rename from test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
> > rename to test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.d
> > diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x
> > new file mode 100755
> > index 00000000..264fa150
> > --- /dev/null
> > +++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x
> > @@ -0,0 +1,17 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +
> > +# Skip this test if mm_struct does not have a cpu_bitmap member.
> > +
> > +type_id=`bpftool btf dump id 1 | \
> > +		awk '/\047mm_struct\047/ { print int(substr($1, 2)); }'`
> > +
> > +if bpftool btf dump id 1 root_id ${type_id} | grep "'cpu_bitmap'" &>/dev/null; then
> > +	exit 0
> > +fi
> > +
> > +exit 2
> > diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d
> > new file mode 100644
> > index 00000000..5e296d60
> > --- /dev/null
> > +++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d
> > @@ -0,0 +1,25 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
> > + *	      (ensuring the bounds checking is also bypassed at runtime).
> > + *
> > + * SECTION: Pointers and Arrays/Array Declarations and Storage
> > + */
> > +
> > +BEGIN
> > +{
> > +	i = pid - pid;			/* Non-constant 0 value. */
> > +	trace(curthread->mm->flexible_array[i]);
> > +	exit(0);
> > +}
> > +
> > +ERROR
> > +{
> > +	exit(1);
> > +}
> > diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x
> > new file mode 100755
> > index 00000000..17aa06df
> > --- /dev/null
> > +++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x
> > @@ -0,0 +1,17 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +
> > +# Skip this test if mm_struct does not have a flexible_array member.
> > +
> > +type_id=`bpftool btf dump id 1 | \
> > +		awk '/\047mm_struct\047/ { print int(substr($1, 2)); }'`
> > +
> > +if bpftool btf dump id 1 root_id ${type_id} | grep "'flexible_array'" &>/dev/null; then
> > +	exit 0
> > +fi
> > +
> > +exit 2
