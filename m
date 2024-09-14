Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2B178C89
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726339428; cv=fail; b=TMCjr1q0WbnoRJyIND0DU8vZHrdl7IlvNrHJ7gYvMwZ8OEheqyC5c8lgc1PXWB9IHm/LkAtPAEhtlRyrjF7FH4wheju3/ifQRf6nnpy2Yr87WCek+s8GrE7cRfNArU6qTiXlR1Wrd/h8kHGM2Zfan83NswswRDi+Iz2kUm2FzV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726339428; c=relaxed/simple;
	bh=0BFPLuCPiT9tTZPkCDAmXs2s6oWm0nYyarkMlFEB4m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u7vpMWftkgBa0bBtB3J3jRQMJmx/7gD8eRejGy7BFU91gQ9yfAWBxGyFmijApIIpIYDnx/h8yMHOkiO85DrI2w/aUyXT970FXl8N8JTsKrxumgwSg2xQ1yRbLR0cpEgjdUiCeajx52AtZzYvs0Sn1Xw90paTJ1n7ywbXU5A6OT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MQba0gfq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XzGyRpVQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MQba0gfq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XzGyRpVQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EFbW74008301
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=U2IDNuPky7K4qme
	d/kc31w6jvEjRukbTQgcgH/H3S+0=; b=MQba0gfqJ8l3cXf0R+ZUmMUq9WwfBTi
	49O3oMp8qlYwn5sT2PQsvHfmjQlfzTVhpsBwN46sdY5nBTWEagEjIuL1AIWhgC3j
	4PJxYgYxzUdC/gqOZ6bN76WbMtAB2tsbQfdyr/9Eu0ebFbXrJ0MQSaNDe9k3x5jc
	FlVhDt5O6qo6wJnQLePo0rhgDQ34QurJlPFuLyTUsMi6F74nC0k1jMJwkB3+PWdi
	S1TIMZJvJ2nQz1oljWk0G+al+aQlcvsDSMjARhgpLrIG9fZRMfl2lIyk1s7OAlVd
	zD4TCaKHtpGIhpygy9qv26dhvwgUuWJBX3XewbHrWe2lNYEpkm6EMNQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3n38pfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:43:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEhgWp034658
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:43:44 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41n0xcp8hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:43:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7/h3dPy2ck9wNFt8rLonTbQV3A+tdWnX72gcHJGarmyvaj82IQS1wJYy1kGUcdmC/W5F+a8NDdyn2sRZouMEHmswmYaLkAbJnShVRS1MrAdPDAKYAbcxJZrDEDrC5+VAXkOScKOm6rghAK03n9nKeAggVDRCaiVXpbyNwbWYKyTCr+VIqvnu2id+7OJMn8OIcQcBZv5kL90/j4uQlqTsfptQoOKPmdkn8pJSLj7wdS8LjcONVoA/ZYMj6c1DPaOK94cSgIQpEWJUl4BDaduEwGKwFc0HFbkFnSiztE89SZPHeYmw9DJH4gSD1QJS6Q/OCB/75Wr3NyX1ZrNMaZZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2IDNuPky7K4qmed/kc31w6jvEjRukbTQgcgH/H3S+0=;
 b=sikM9bNwGJYGQSnac/9qYkABMrDPZvD8QuthK6HLtRfgjThjefzGeGT40V/0391Ef71/kZDThm6fD9rq+MF74iUThtjy1/1znG+qrFfZ1wo+SW/sOixS6ok7d8zmxWp1rRcq6UtpknqfK9l7FTIkRi/vKxSTOTTE/ZzXi/IPHMAOEqWN2ROaHRHzeaKEFfubq8y70RebsDc1O2MMrdvCCjUHzlOUBfvHZfh7vWeYnHMXUZIUCsBvLuKp/xXWElQcL80lhr+VAHNm1+3x4qbfpG9sXWY9ylEnc35cOtiNNfPjW91b9e21PrE4M1rM78cn8cdMyR8+sl4+M9iMQHN4aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2IDNuPky7K4qmed/kc31w6jvEjRukbTQgcgH/H3S+0=;
 b=XzGyRpVQknAHDJjVuo/+d3VtNME4KH9hqCWFhmQF2tvU1iTd6t9rv+THp9aCV/1LYMFVFjHYPlMjfnPTEdNHHjJ0qFUVyIDrazPvTFB14L6BbK7urpkBhcAn4ckRusXoHNO5oZK6NSRkQhRP4iR5P8p9x/LjytXkpBJvfSEHQh8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BY5PR10MB4306.namprd10.prod.outlook.com (2603:10b6:a03:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.10; Sat, 14 Sep
 2024 18:43:28 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.011; Sat, 14 Sep 2024
 18:43:28 +0000
Date: Sat, 14 Sep 2024 14:43:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 21/22] test: Fix DIRNAME
Message-ID: <ZuXZTb/RNbfPlx3+@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-21-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-21-eugene.loh@oracle.com>
X-ClientProxiedBy: BL0PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:207:3c::18) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BY5PR10MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f90f17-07af-4fff-ac27-08dcd4ed1f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AbhRSdt7bqxMd6jZmN4xW4B8OuN8Nc4KrXxrzsERQAOX8PuH3+oWKaGcMsxj?=
 =?us-ascii?Q?5SI1WDdtUFPknv44xUix7lBVnsk/BEdH5SEdyJ8ai1U1xNoZoeH7KhVUMYiM?=
 =?us-ascii?Q?ngA4vuTmVRuclbvKMIUYTYzhDTnlP01rs9PRBTRXjAi86KN9WVDNJygSw7v4?=
 =?us-ascii?Q?q0IhPSJ2TeI/eoRP00OkxcQUudQdTeWv4CZN9p44bcgqKn4k1tFOFqt4vV5U?=
 =?us-ascii?Q?McYh7Nm3765pu+YCEkxTCdCRp6pddsWqaNi1aKYAXBCBDFxmYJOD6vKDoihZ?=
 =?us-ascii?Q?4KJHxZSo/QPpBtEczP6VOOCcusZ3xv+uw88zOQuRo7u/6dpNTuniQ84nd2UA?=
 =?us-ascii?Q?lyGi1hhbmvwysbZ1MGcChQ34l7J0AA0UWfhnvGE3WOfqDSp4vXDdL4WhnxO8?=
 =?us-ascii?Q?UujnwQR9mjciz5y3p8NhX2EeYGwhMDkIq7DSKGbTSqojdQG7rhIGbPgeyoGg?=
 =?us-ascii?Q?fHayMOwI121xZI+vT6ROEbLqJKd8MmQHuNHuq28rFDshls/mfc0Y1PXNTwHo?=
 =?us-ascii?Q?F9H3i/u3ItJkZkVf2tMeFJ/pr6E5l6wmyqPunvVNr1+Krsm1nmIUgYRABR0b?=
 =?us-ascii?Q?dogUKNO35wH9iSehUjOJEVDUDBWAPdxaAoXsnLimElRNbQpKGCSDHI2A8c48?=
 =?us-ascii?Q?yLpN25SoLzw3cdTmFYlY7XedDjLgOjnz1X1L5kO1F+kk4Q9F9w6PHJH84iU6?=
 =?us-ascii?Q?n0/HDee0sJnKrKEKSdpR2gdSK0WFWq472KqteagVboVHxyxSI5g6yKdioxzA?=
 =?us-ascii?Q?PqsT/sHm57nho111rCsNdA7+YuSQYFexmew1PqTUtN42Tc1yljbD1ZN+sYZp?=
 =?us-ascii?Q?OTJsUC0BIfCALmpf5FwJm2P7+XVSL4PZ1YXZkkKBWKCYPX2GOuzT5Ec8auA3?=
 =?us-ascii?Q?xwB94v158BFYozj8eHH6baZKohVWbkK96TdSuKMQKQWwvX+trL4t0LpXLdrQ?=
 =?us-ascii?Q?L2N5bs1+x2NaogmE2fTJm8R/qw86liJHnaVxNtPf9j42yzT69b6ByuJJLgXg?=
 =?us-ascii?Q?+qfucWlAygBjz+glO0AI3JENrg/N6MmuTtSbjUtIznob1BwYGYyRpsd4Ty3O?=
 =?us-ascii?Q?5tB4NYWYMp45t3SWKWe7uOwVEq9BBevJimDMTr8dPB3TQgVAT9G+sp7NZ72E?=
 =?us-ascii?Q?VoLPeegWZkuhAjDong5N2SvI1+dXsQ0ABMhEerk6wS0oq4owOmnAn/4NLZRE?=
 =?us-ascii?Q?BF8Gs77kvCvm/fcWNPRTHYMsXXBbMJ5hYonzsPNLJE4xzPPD7LcSODnkpw/g?=
 =?us-ascii?Q?KduPGKOC1ERATZ/30IppjJc34g+bztJeipVnAN+7SFqx0QzRXXFcjcsJss84?=
 =?us-ascii?Q?rapQusyVTdBMo6/Y8i2YnCiI9cIZ8ejPmtBdXLTHyhXZAQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?84eln6J/boMPr8Nlo0MUlXgvoL03aoeZwexg6hqnMV0UipSHzr43sjpmco7u?=
 =?us-ascii?Q?+VPp+UzL8N/LcB9JJweIhfEZhw/YsSY6S3lmoPGFzzIKJoYCDqrq2rRqo/r8?=
 =?us-ascii?Q?t9mIQr01WhEEN48kDxLdDXjD9nOKNBXf24HwEjjgNrjNhK1DmA/nsrQMADy1?=
 =?us-ascii?Q?kotP12rJKetK4wzW94Y3nN7pvGs0t56x/LpEAwPnEw7JnqQLlvu4CSt7YzIZ?=
 =?us-ascii?Q?/bKv/rAYa0hWitFoZbRv2wzV8WQy/eYu6f5daDNWNrPsMeGRzFsu7UkNCIWb?=
 =?us-ascii?Q?T3mTy8VNSAwpWnYkky3RXWgJjfPpvvGUBBB5Uz4fwneSo67b33dJGk5HhQ2O?=
 =?us-ascii?Q?HD+jeykJMASmiiQAbyAS+RG9Za+OXwe7YI+c9i4rSvasJ0RO2TeJqdDRqF71?=
 =?us-ascii?Q?3ilFMq//pI9B9NJdaVARZWAqaZ2fL0QWOJSkk0vg8S6S8pUAZRdTxG0mMbeN?=
 =?us-ascii?Q?XzXOdqRLMzf8tOH46kYHwkmA1cv8lH7y+/QGrv1vU7O9ECpiJTM0FjWhKYYY?=
 =?us-ascii?Q?wdjfLQkxKEdwIvNU2itHWCqjcu8elzDZBkUhLH3ov7MDMx4gvssGD9sTjO+F?=
 =?us-ascii?Q?W2J86016/vt6x7Rhm669MRTZ/jGdwRblifCXbPtp6HWgm/HF8pRvLShjnhTV?=
 =?us-ascii?Q?7FEOkhtaC77Uz+6s9/RIGTp8J5enD6feHoWdq0YTT1p8HOJOmhZ8ahdTKX7E?=
 =?us-ascii?Q?DVvRVGtmZPDv+E5y7HIMu68+gtTuZXJWK2gwURL1Ic+S5qajGRYcyoX7uPDF?=
 =?us-ascii?Q?xGX3ig8m9ddrtnbqut3PRMLeyEiQE7JGM5Gw4efLk3EWhhPjawDIdaYx+4p0?=
 =?us-ascii?Q?sxEjLRVK91ADutIkbgXoQtoc5FAbCikVYJezvf51oCJMCfV2uNDRJ7qN+Smi?=
 =?us-ascii?Q?l93XDsmzuBPNKivOr8cJ/9hHR2qRlQa1NILnbJ2L+mSrubvCS4eu/WOjHJQP?=
 =?us-ascii?Q?yZHO0+36yzdWAAYWfJpk9M6re5fkjpyutrcczVnamtrJ/z3fpRutNXGxUcMG?=
 =?us-ascii?Q?DLRhJ3mbxlEo1dpWYwFCyhtUhpG4BpdqUEtgoD2r0hF5a0jz3hEi7phC+5hn?=
 =?us-ascii?Q?HFEfFhX5CBmZU0LbA/UmliwfXR3z6J/+yJYwb75j3AwQl4DCXAJTZXCBEan4?=
 =?us-ascii?Q?QYEhXSwbc2OUohOfRcqm/qTzBixZV/clW6+AlOXZk51dT8YQ9gqDHYH1YBrR?=
 =?us-ascii?Q?nwg481KdCR8fanOPVjcPqcORYPFT2RguNIjR94rf0tNVKnez/s9pmyphyigl?=
 =?us-ascii?Q?38ld6gBqaKSRdx52EV4+gSY2Anu4T9tnQ78aPpkb+2+W/Qk+e6dJzhUmAq1n?=
 =?us-ascii?Q?PKxlczFIPLmedNkKA9tukp9Mbs24aUxLDWiUhPl/MWFlfZi/yHWrVzRg4hKj?=
 =?us-ascii?Q?b62I4+h14ykdHVU91WGkioaX+DDALT/2niqGn+yVAvNz9aiYO0ZcWBc2ZfmC?=
 =?us-ascii?Q?5dZ3EQPAB1tIRgfMTYiLPuvks1qJI1K5NRPfy/J8wZBiyXkcIzbRQ+usOpkd?=
 =?us-ascii?Q?MJ7tsREkjfSunuRLEiZ7HalP22KqKHU3YW8iYkKo1h8rIpwd0ujwg+LpbItK?=
 =?us-ascii?Q?4fHNqTRJ2YiII5YshapcgGzHZP2e8EAIk3wDgFmwerXepCxOm0r1bVjBA+dE?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9EIeoK6vegjLu7hWEEVb9zfVEMd/YPcfjQYA3IGW4WtctXQ2vyoT4wcvJeQSoXb31DXXZQb1Cmkq9R1KQSiq1T4+iBG4KWJz0V0yJOw1/cihyjED2ErSRGHApKT/6dX8I30m+4wuEWPP4tId8uC88lhHBqkTlnJGcCcBZQ6v1J68ci/G0DFIT+6mFHAgkSM1tvgssbtZDpwOELlcYfa+y7OkrvgZRDw5fIFss5Nn3ZX0e3mgpMWppJtmn7uYqeTE7x1Rj1VPU1UOTCDA65wp+uoQpM9jZSCNYYoANrLHH+XpHB6ywOJEaNTz6VTHtNds5UvkXUcYcjTZ31oCF7QmXyZkRVeb6ZjU2mnM/MHAkmUeGj04Cf+RYbe8LTf9dZOvSQ/fXTQmvUnOT519lGgop/oW5Bs3DKiiTIm7mf2ackGajt5BXSj4nHF1Ul46B/1vCvaCZRYWgRI1LG/0DhFgLgkfF+uCHWG39WkRgFtCa/O6hHdEZb30ZLvGXhxLET1/bjFF0SWFbwIWVnFzabhRj9AKKhL/wBk2AnZhhz2l4nnNq8cLNItxk5Eh1GTFFr3LY7yl8TOcJH7aIAZwMTE3dgtcMJyzYQwrwzCQdfSL/fE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f90f17-07af-4fff-ac27-08dcd4ed1f6c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 18:43:28.0095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xM9RqlNxshc5xhyj3hFk+c8eiVDbasMllUJPWvQNP2P8FNewzRuQgHY2IO8lY4mm5O3KtYPgyJzxEHsyiFQGcbXISrc5jK2zFvqv11Y4OiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4306
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140132
X-Proofpoint-GUID: yS5pHXRVubCMNpzC6fweERNz7YAajr2K
X-Proofpoint-ORIG-GUID: yS5pHXRVubCMNpzC6fweERNz7YAajr2K

On Thu, Aug 29, 2024 at 01:22:18AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> index c5dfc72b..f9b1d8bf 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> @@ -26,7 +26,7 @@ dtrace=$1
>  CC=/usr/bin/gcc
>  CFLAGS=
>  
> -DIRNAME="$tmpdir/list-probes-func-usdt.$$.$RANDOM"
> +DIRNAME="$tmpdir/list-probes-name-usdt.$$.$RANDOM"
>  mkdir -p $DIRNAME
>  cd $DIRNAME
>  
> -- 
> 2.43.5
> 
