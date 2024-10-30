Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B281EB9F8
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290367; cv=fail; b=dTaZd8Wa3JPsGARB8Qg7i4XFpZFVQNGeG37ns2L1JoEXvgOfsIbNWZpTVOy4jNftUm++JRh6Y5888xxpXKRN8SOa3lnwWUmjMYdzrXkf21omRL0B6UzhaJzA4fc7FfBLP7IDMe8zlb1SHcgX37DpIgQUz3qlLtAUrxnhORVaB8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290367; c=relaxed/simple;
	bh=IoeqW5nBAiWa8/XTHTV3poCq8w8EQxtiDY1Vf1UUQTQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KLTxJpoFtKtTuHJ6MPPXgCcTeFcq3hEOJS6EbIjNrtG1i2jzjOcqFmEAESq+R8O/gmzU7pGm0YNu2sZwbrEHFQGCDJfpTXSw15qD0jj1qmfDtgkcNFPm99bNBRFzImnWIrSNBFJVKelkal5a5fZBDnJ5cGG3ekHPc917ukc1w7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iw6BtcFr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ioidvUZZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iw6BtcFr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ioidvUZZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fj9f009124
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=Xbyl/3CYxvDoFWVU
	RdIUwAEcfV87khd8XUc4fTJrcSM=; b=iw6BtcFrl+FoUctGKUxkiSf3nzIuzaj/
	7J2m7H19SAjZDZP4H3hni3+1t49HnHEZhhknk/BjCV9+chPMmgm8NYUROBgJuCXa
	Xl+PyAh2148my2+Q4zpfe25aUjkwxyN7l64BzB5R7df/HMFyiv1STAcRW8PHH6MM
	WJw2cqbDebe44cxWT/geQAgjuN8KTAeSS5XX65cXg0811SgUlSFt3/mbNTWe3LDs
	u31TvtfGtnjxo04MoLmPZU1zBs7IWYd3QTlMAQFmCangWjtGjCDedmHbwZbft8Pb
	tx86ZAmX8JyAFgmXKUbEtQT3UJVVKZlRJlVw5Qqzw0qJ9r6Jx3m0rA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxqu9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAsVeh040035
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:43 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnaqfjhp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JH36P1sDpFwLUlymGCwZCqxbTG/+oyNTQB4xmspQ4Mx6zm1J/KOikE1mmmHy7A1f7d6RIE/kxKeq9rLCXB37Iu82cAthjYdo+NKYKnOW8BSVD/TJKr5IEi3OPtwPzFqW2Izm99GOyJESQ68m2pX3mUdjcyxGTlREmKilufzieYdHLOdMQNGAe62rJt3AH7JiM5gVxsnIBva9LahsRgyhf84agQYNZswdxIh2Ctoa2ISiplkX7DkTeN/vxZn8wl4z8I0Wkz9DgI+AoMiwp09WcKK/ijtRdHjE1gcLgZXM3pbI16p7XUQllXJfHSh0saUHxGqIsjC29kp8gt0ac3uUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xbyl/3CYxvDoFWVURdIUwAEcfV87khd8XUc4fTJrcSM=;
 b=s61AQ0/t/E6WEdmlZv/R54+v0eYt0lpbgqQRA/Ycxht+7T63GjxOxv3bLT3rhW+5DuQXyc9KncVj5qne6h8RqqEN7FOoHL8iXAimbqfkTj9VVllSGgtNl0Y7COAqEvYywYM1yIjj2XSwyTKW5VjKVcnp40L5Su1nMz5bQv8HNk2bxtIBjbZMMM84R9bKOMqXzxhpUCa9ktWVqb1xvKi2RY5TTJeMi8Q0af121b/pWKapHvniOe4WMBw6rn6jvvO9t3wfessH77AmVQ+QntVPM8siwfkCHNNow+dAPmtV/pcL7MC269Pg1YuVuOyiIPt3eH60vHVl6UnEnKSHBddiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xbyl/3CYxvDoFWVURdIUwAEcfV87khd8XUc4fTJrcSM=;
 b=ioidvUZZtqoM0LyIiCq0cmB6Bt/fn04w00EcKFuYnftjfSO5JHpNFC197g42wxUI4RIMxxjF9C0L3gihVDbY4LtEgTPUnllspa3ncoa2+L4t5tEU6vZZRlPx4hiuodxVmcFIdTkie8OexKrWUVS/Z0ENj2XuPhTMeyVnRouxeok=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SA1PR10MB6469.namprd10.prod.outlook.com (2603:10b6:806:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 12:12:40 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:12:40 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 00/14] gentoo, manpage, and assorted other small fixes
Date: Wed, 30 Oct 2024 12:12:22 +0000
Message-ID: <20241030121236.257803-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SA1PR10MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 077c4cad-48c6-4802-0df1-08dcf8dc2645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?93kyUh+K/UTka2KuWCQzKn62TU+SLYO43TxVohQP7PaPj0zlZVG1TsG78s62?=
 =?us-ascii?Q?ClzWY5W379yLCBc3KlwEwlSwZiqWja1bSTkePVIcVymSLUqLJCFAUabl63b6?=
 =?us-ascii?Q?ZlFI83UqK0Scmh46FEQofn2tkzgKaNvCV/0d4/BugKkP4GnNsU8MwjM6iLc7?=
 =?us-ascii?Q?FQSMY76EekgSFqVUwhPQEv2s15aAZYvdtnkbGIFCPYkT9YhrVmSUbD04YLEo?=
 =?us-ascii?Q?CA/J9ASKh/X5tFNbnzS8zscS04S89yKjH2/cau2nYYo7HAkglWkNEhT7Xe/z?=
 =?us-ascii?Q?lk3Sf3GeO1ikDlNrB/QjLj8ZgjMgoj5x/4FYCwYGDlNhPGAEHSMBQFJCQESP?=
 =?us-ascii?Q?xrPd16cqkAEprgoiQ19dpTm86HqjTczd2qj8F5XeEUlglqUJBtfLmMkodDYd?=
 =?us-ascii?Q?kjK/jF8bLP4dZ3l0rFoLBJ2NvnZywl7njvCnk8lB45vlhB9NnaAdz577WScs?=
 =?us-ascii?Q?cmLxn3cet7BvD6z/z+N57QdHNWQzZ1HD41rxER2IAkkcCImfGfRPgH31tg40?=
 =?us-ascii?Q?shGAAAlCI99BKNN3ijq74Hq4RwuECCW5pCp0G6RlfOhbxymASJMv7ppLMJ3w?=
 =?us-ascii?Q?DJ3LTe93s6wjyjqHJuRyIrbGXdIpfrIn1glGCWzeuuuFGMmXpjfs8Qi3RTsa?=
 =?us-ascii?Q?kosezNmiQVxbRW3WMTz081lU+NO9b3MDDXoVOoIBIV9zMoisIkca/y+DU1gx?=
 =?us-ascii?Q?LZ5OFkljtbsalCv/sF6ceuRetFecgnBvJLZ6I5775bzSQW8VqEojpI41pqub?=
 =?us-ascii?Q?eXD6HMP2QTrZbDzYqafBv5XxACIpMfmbX1OlGZ+w0rlwB/KHJ8qvD8ygVajb?=
 =?us-ascii?Q?pc79VniTDgezyFMxUXIxETCyK1ExkLDJLCefib86B0u/joAWI4UK4ZBUd5nF?=
 =?us-ascii?Q?j4ePaEK6gTyO0M6wAInyn81wZn1i9GxBf9bs9iSlnJDVub09KbZB4h6Ly5Fr?=
 =?us-ascii?Q?BucULPCzkbdyF81Jh73s0ynQPVYaWVE8GPK8NqnVfCfCEt8iiTkX9TnKyJWE?=
 =?us-ascii?Q?1Ydp9wX9DbfipgaGwa8FdaYm4fY4br4hNSs5+v4t7Yj1AuVWntoRb4zjHNWG?=
 =?us-ascii?Q?nX9tdQKTrHnCkqWfxoYvvxAFl6rBvl2//1iffseR5Xl7CU35EVUcGQTMuD9B?=
 =?us-ascii?Q?GDSX8oc9i8KKofv342A4jY9PlOxeu9I5CnNkyPQjC9xDohq9ZULecy4Ll9Xe?=
 =?us-ascii?Q?LGYDudOIQSPd/0vI18BYRd1C1Erk7ZgNnQrGOGKybrVB511fdlGigEltkB/+?=
 =?us-ascii?Q?C9qlM5rb/cW5CESjb9YnAFbGnvaxPTf54s075WZfbgpSPDTVdyekVI+kIlGm?=
 =?us-ascii?Q?EOewHV3YmaSkyinJZMBObNzw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SreAr8SOUEXZxWPkDC/pxaoPIK6nARJCWJPn+AiFnG/V9bWxGPYr5HtWpqR7?=
 =?us-ascii?Q?yZCrQIF/1te7bU7z/GDIZqXfxifrq5NZvL/xJ8nDnfpgNkg4fX+2it9Wu0+K?=
 =?us-ascii?Q?gG5Mu8wCV3COWMe6ret0m5RnCr8WhI0Az07QyumzW9+BEORKNCe4xpSOYl0q?=
 =?us-ascii?Q?6wc7i1kYPGeCwIgOzOSQpLBQki/7OTPJRRvdaYoJ0MKpcG2KWARJEGbvt0Bv?=
 =?us-ascii?Q?uveyZHd8WuWG1MhDllutfZ/t/HoRsbkWMgdVVIOH9g1YvsLtduR7qhTZoLZh?=
 =?us-ascii?Q?YXL4aQbZ7x0n31nQ/zGMFoehbar6ezVXoizifNt/c92hGjOjJ4WGQYuXBA5/?=
 =?us-ascii?Q?lLDl8IysKKRbisT0+6vcXq6C33OmuH+S9obsAb1VfUsL0dVLwVF9SL/aeZf4?=
 =?us-ascii?Q?oVfau6qXHIYqnFCQklsY/GWhHq7hdD5vwBItL0SCzV0wRY9MXEBmOJZ4MVLN?=
 =?us-ascii?Q?9eOH/4IDt8MjenEIDiEQkK9D5tKUoW7teEXbhS5kj2ATyh/Kx/Yet4RHW8L6?=
 =?us-ascii?Q?H6OM+a29PP+/wFF7Nd5+16CItIctmPsr+6ONUlDoSzSsJnA73+uON4mMuF8r?=
 =?us-ascii?Q?vmU8c/QJ6qpQQ9BKROn8GRgdDoe6WXIX+aFik8uRVznlezXjhxJdPvnJN4/+?=
 =?us-ascii?Q?gCBQ0F/Tlel/YZow4bLanoQJpzgKkasCUQnIyMzTSy+eigfq0lI1yv9O/lUB?=
 =?us-ascii?Q?QpnQvbjiKQweZa+DKrD3R61wNJpP3U1KphFEmuIHUwCsNmM2OyGChoROxKC0?=
 =?us-ascii?Q?WCh/kfVZ9dz+6CkRMuAH+3U79ewejxAI04o2BAcjGzJg/ynb8xm8OPUp2Yl0?=
 =?us-ascii?Q?0PRP34SkNIaxZqw1S3k8XYzkCKvIDlXqvdNdrMBBTHdQPTHioS44rQAawxAX?=
 =?us-ascii?Q?wtRJr5LMkWMnW+ofm25wwIk7GIjt0wuVRAobUY2bigH7lun3y0+h6Au0g6qO?=
 =?us-ascii?Q?JUGFVII1Qj5t/rcpgkL2dhqXdRpJUfQ6MjDwSIUgEwdFpMAO+un1EG2yiRhL?=
 =?us-ascii?Q?KcRBjQ/GP/Ssj9Hq2Cd2Yoz4un06l8g7p5Bso/VVDiuemjaOTjr4D1qWPAz8?=
 =?us-ascii?Q?xknQOYpIF6SZByhVOFXxsIP+thjfN3TWCcDNa8j3WlW/bm5oArUrURTyn4c9?=
 =?us-ascii?Q?y6Megx1y7h8ytAQAaDAUWsBC8F2Uqa7n63vmjvEr+QUgQr3+0kEtajYyMOhQ?=
 =?us-ascii?Q?cX7Oaow6hxJRH7Enyw6rc9A9x+2QwUVCQ0VSzyaCHE7HOkccqCvNPqsphyVX?=
 =?us-ascii?Q?hn5ljZANKequtMFKyOB5upbqcywjsxZs5GGnxuTP+NDlXo61kt9uZI605MXR?=
 =?us-ascii?Q?/Gm4zG5pap1UBBcdhtgtGb8DbhUGRGJNNvVOGWR3zaZ2ZzoKW6Sjxheqb0jc?=
 =?us-ascii?Q?QFbw3VBKxBgYFz3TP413Lo1kspmASrPC3Ab9ThXENUjgLJj1LYoCn8XLPcA+?=
 =?us-ascii?Q?WXfxk7cdWYU751aucu+K6fbHNWsopVJVZ7cutykYkezsys+IMAgl29tlJEHI?=
 =?us-ascii?Q?TEdxMpnhBXDAjni1avQ7B2ie3yhfwB4nseRRcSY8YkncbZBdodWBgDsQbo0s?=
 =?us-ascii?Q?lEiAh6nwv8dqm6VKF7MQPk+WJJy/rSP23/7HhZ08VMcgK/W80hC/3AuDMCOV?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	InAB2Yzp+gT9n1GQlTz+0JrD8TtKQBPe/21PtG0BeaPlmAM1PdyI9TSyh1HrzolITonUgPy53Azf91bKIpNRCaWT5YywN7JlgCKU8kBNi8ptubc964d6cHB23s1Ky7/B+tu+WUevbuRkv7Boka9ssbfp83q9UwWXAf0bSFkyTZg8D2dEOpXf5fEAS3xsy/kD4DjJbPkH2iAdaGgHvw3l+W5Z8Nuo/lVPKqcTu1FIj3CR92kQaZDpSfaJsaMvzKDifwDPmjl8jqlnALQSOMqs7kVFqJZ/dzkkLMFOc/kfuq4nNxbuBvffCXDP4AfhggbJxYUeOVX8RMkJRY6QtVkGJiH6adE0I3oZ3OMlWOSI66BSCCSnYYwcDXgUAfBTnmgVmXobeOZmGifduNe3KfLa+glyqlBbU7N6XxlQ22lQF9FXkgs2duVs8E+KWHvGmAkEDcSMxuOtkEOLjguBU/DwguO+KYUPZA/U2R1gVbam4hSFR/D0YLA5HApd7jdKqUJ7Llcfbeqjdid97sqDhOGwYZ7l9C+W1FZQe4sa+xdkgjzyo3mLYzEcOF63VorxYB4m2363KXA1mhx/pIYgsbbiZkZ2SzxD0SQl/WuJFItv2gI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077c4cad-48c6-4802-0df1-08dcf8dc2645
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:12:40.0097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJ7db3BrCBGrNMzW4QrtYHtFibI22MAlUNrq87V1eqZIShrvOwCcdZ0N5JjKD1i2VQ0I/B5Eb2Au6yrHHXzsvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-GUID: hkq7KBblZ5ZjXDMG_3XkqRNsYjGyJYbk
X-Proofpoint-ORIG-GUID: hkq7KBblZ5ZjXDMG_3XkqRNsYjGyJYbk

Most of these are bugs reported by Gentoo, but their request for a
dtprobed(8) manpage triggered a sweep of the dtrace manpage too, plus
a fix to a rather unfortunate millisecs-versus-sedcs bug which caused
us to wait for an hour and a half for a dtprobed parser child timeout
rather than the intended five seconds.

The only potentially contentious ones are libsystemd (quite a lot of
code, and not ours, but it's BSD-0-licensed and I took out the most
ridiculously overkill parts), and the last two, which drop apparently
redundant markup from the manpages whose purpose I'm not clear on but
which seems to be ancient and is probably working around bugs in old
Solaris troff or something. We can probably assume groff by this point,
it's been the only maintained troff for decades.

Changes since v1:
  Review comment adjustments, and replacement of the INT_MAX
  dt_probe_lookup2() fix with something rather more comprehensive

Many of these have already been reviewed and have a reviewed-by: I
assume having the whole series reposted is nonetheless clearer
(I can post only the non-reviewed-by:ed parts in future if you
prefer).

Nick Alcock (14):
  No longer depend on libsystemd
  pkgconfig: drop spaces in variable decls
  configure, build: make valgrind optional
  build: substitute LIBDIR in pkg-config files
  probe: improve dt_probe_lookup2()
  configure: fix dreadful behaviour of MANDIR / --mandir
  man: the synopsis is ended with .YS, not .SY
  man: use \- for option dashes, not -
  man: drop blank lines
  man: fix blank line in environment variables list
  dtprobed: fix parser child timeout
  man: add manpage for dtprobed(8)
  man: drop double-\fB at the start of every option line
  man: \fP-ize

 GNUmakefile              |   3 +-
 Makeconfig               |  37 +++++++++-
 cmd/Build                |   2 +-
 cmd/dtrace.8             | 151 ++++++++++++++++++++-------------------
 configure                |  19 +++--
 dtprobed/Build           |   9 +--
 dtprobed/dtprobed.8      |  64 +++++++++++++++++
 dtprobed/dtprobed.c      |  10 +--
 include/port.h           |   1 +
 libdtrace/dt_impl.h      |   2 +
 libdtrace/dt_probe.c     |  47 ++++--------
 libdtrace/dt_subr.c      |  15 ++++
 libdtrace/dt_work.c      |  16 ++++-
 libport/Build            |   4 +-
 libport/systemd_notify.c |  70 ++++++++++++++++++
 uts/Build                |   1 +
 uts/dtrace.pc.in         |   6 +-
 uts/dtrace_sdt.pc.in     |   4 +-
 18 files changed, 319 insertions(+), 142 deletions(-)
 create mode 100644 dtprobed/dtprobed.8
 create mode 100644 libport/systemd_notify.c


base-commit: 8a1264bf0e818c8624be250eb5174714b62ed93c
-- 
2.46.0.278.g36e3a12567

