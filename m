Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCD118A6AE
	for <dtrace@lists.linux.dev>; Tue,  8 Jul 2025 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995855; cv=fail; b=CSVHZHGegozo8HZC3i/hnXu8J055L7DjAnF/7LmkOovD9Vm7e3zLercp5ukpa313DTlDUSpAyve31JRQxcCjqm7k5RfmDZCWGjHmyYVxfE8LxzJBrOyaejRl+tBAjCzS9LRDNElmCLvdcSxigjiZyB0EDlWhscXg5OXDsYzwjsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995855; c=relaxed/simple;
	bh=WRU5F2rTdi7Dzva3vvKoxcW3G9d0rY43y1T/J5hti7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZglcUWty0h8WYW3G82x8tkrsG9SotSNnXcPWhvcVJBbI1K2iknx+4D/FaSDvlLFn/mdrI43xFxr8GhAmdIDssfO+p4j+ts4VmXU9ND3phBI0HrSqlAQA/geMab4XPBbQr8BPpeEX3NDavSDvD8mXAZ0VdMK7S5OlV3+EZN0fmEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TkY1nUko; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U9D1b5rc reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TkY1nUko";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U9D1b5rc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568F7LvF027224
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 17:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=r5egsQ3KFMLuU2CkDqLd6NRMklnEsdUEs2xgR8cFoiI=; b=
	TkY1nUkoy4QZXj8jLPTY/wZPGkKZd/ex7pL2nGcUa3Vc3PsOP/RwtweBQ5Z8M7Qg
	kIKLegJEsWCjhuuyLoTKn4doG/XaDZfWq+pXQWW//bjVpKX7lgqVeJRjvyp90OvN
	FkSbx+Ih6nSqA06iFjQBaTxgBtFDI+yHp6QjRnNGLTL/dJEygMVLtiWbrUbFoz4g
	oHQnJ4OigjAteZZuDEw/ZWp+o0eypscewgYaa/hFuYV35Pq95ySvyWv8JhkMWfSU
	GRwiiex8A5mQK1p+oNIIDD87HE48ETifHwjbWfFDGCgaN/TY/udqaiK0fpCQiQeW
	VpyF2Yw/q1amibE6/b812A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47s5pegaw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 17:30:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 568HEImA024219
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 17:30:52 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptga5uxd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 17:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJ6ZmEH9i2LxOOWWMtz4gWQQ2zVqkY7tfH8UGzsOj36IkZbda698xIJYVTuNC2fUpiqI8Nz3Ss61pHpqEpc2pwsNxIBLrh5t6AxyTywZzq+J4b2JGXOsCpHzq3m/ngq1p2/E9sE5PGFEqiLMHvaQCWLDGLWuBSbhkl0Zh9aYtnoGVyow0rRSIkwj9NJ/TUcgQYOAwqVuzIlcC04Ys+FpevZUGbmCoNUUJ3/wRt0/8j7lpOset1IV6KrKbsJfIxmC8zfCUtWsUpZf8lZ2U86PmXxRJqTWRakzCDUISZ9d26SErbP6pqzhNfR26f+TbnLO0ZU8rHRG9xCsred5unLWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+W62vidN3t8PcJaSCBUtkFAm4feJjqfJp6Kvn7yrEsg=;
 b=Q6sDX3ujV0zSZFImg/hfp6dgG82/xMbktcv4///LTceO+UTiO+olpwh3N3tr7EErjkfs72frTn/HoWblr3YYi7G2Z3cGzWexyPPcv/6ISqDej/eXpHYLLiDd3Cm/Q0yfyCl/0KpaVBPIlDqFBUO6/heRI6bnTHyQlSJCxzyOlYEfMaE9zWOSiyNPdVTwgNQhmeFzjCd4InIa+zb3C1luMo1OQyLDSVwnFzcFYZdsChglq9zUtmYIKygyQ7yN003FsW8GpqHdPt8Kq/d1OOnv9a6ELnoi58/8TaIjq1miRcHrzE2+XjZGLhkxSaoQawIxITBawS16aifHWiEFWdRDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+W62vidN3t8PcJaSCBUtkFAm4feJjqfJp6Kvn7yrEsg=;
 b=U9D1b5rc9OzIlXqY26NxnnY2NKPMrOLJ7hcRVIgHkUIg9v4jCSmCCdZBLLjS0Ujpqn8aZCF5Rle4IhcdrUWczBm9uLkpIiKu2yDqWiLvBB0x07xlGB/sCYtWe9jYuX00gqucRSyW6gWqjh4RzDPeMIbesjzjtMVY4KpZbXkzP9k=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ2PR10MB7599.namprd10.prod.outlook.com (2603:10b6:a03:541::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 17:30:48 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 8 Jul 2025
 17:30:47 +0000
Date: Tue, 8 Jul 2025 13:30:44 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Message-ID: <aG1VxM+BhwPPv9hv@oracle.com>
References: <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
 <aGbvQAmqsLA5+LaH@oracle.com>
 <aGcF67vQ8M942gh0@oracle.com>
 <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
 <aGv7kQqlPZt6Kmw6@oracle.com>
 <d74b40a6-0834-4edb-8cf9-dac28500a7cb@oracle.com>
 <aGwmKfOPU+NZ+ekf@oracle.com>
 <a2c14fbc-ac46-4e0b-804e-fb6e6c3e0751@oracle.com>
 <aGx1n+VfTcUaHIq6@oracle.com>
 <7acf8a29-0ccd-4efb-8b82-92b0bac6cebc@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7acf8a29-0ccd-4efb-8b82-92b0bac6cebc@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ2PR10MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 436583e6-ad77-4bb5-70c0-08ddbe452cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?XzAE0HG9HA/u4q/Lc86NnqgcL/nGRGSo4iVDLqn3xvYwurYBMNdfheJ7Fq?=
 =?iso-8859-1?Q?qCIENGpmFcwVcUeWXVMcOkKvLlHQKzIJl1mo1LAb5JmIWFo3Dn9kb2AG6/?=
 =?iso-8859-1?Q?ntmi1BTebsx9DCmOtjuodwJD1SRC0Qusu0Gk25gM0bFSTpB0LUBnMFyPO3?=
 =?iso-8859-1?Q?HMhjEmxx/Ovl1TB8bIuxXGvZaNQ+GJcfNwevq5xbf3vxDinEkO3bqBKtOQ?=
 =?iso-8859-1?Q?e/i12a3pcnbv8PoPtb24FfES7JJUAZ9kcCcZc7XzF4H0tHe5dUX7Ta/dhd?=
 =?iso-8859-1?Q?95gG3ruhwpWcMyLa8MAQztAs3gqnyb51IFBxsmAsUw3rrXEVrhwNxj+7dw?=
 =?iso-8859-1?Q?wlM6n6SjC99eyUALNzSKknqcTaJoxVCuGNb0TDdgHo/uo3Fcpum7PGrGuN?=
 =?iso-8859-1?Q?1zReAA3J/DW0KKAFceyzk2APDDfSRETuA3pMr7V6VBp8Pz1TaoPuk9Z4g/?=
 =?iso-8859-1?Q?hAoZvDk1D82q10g6mvZlkDV7kucyeu4YdADez3ZB0QKXxnfDdN0XloU7RP?=
 =?iso-8859-1?Q?cEKzMJfKUZ1aTddaG5MUgQQqk8QUUPO5KztfCylygRlDWvb5a7x6wzL6rR?=
 =?iso-8859-1?Q?+1VSJNBQ8YuzBzmPo4ddr6OtMCfKff4t8VKIuP0sBH997O4syb7cHqC5dK?=
 =?iso-8859-1?Q?S5M72U/Mw1QsA3phUOAkX9qB7OIPrmSM+O7a7RcbfmFGRlN686qLDBC2KG?=
 =?iso-8859-1?Q?B83HoOBvCx3NOPJd3GmHi01VmKJPTGcJjOrr6dC6auwefmAkk4IoqohS3c?=
 =?iso-8859-1?Q?RDpLn/7XG/1f3BCizeP9dmpCatEYkZNnkReDBk3hcxeqa7UHUtYW7Mt7OG?=
 =?iso-8859-1?Q?x1pwjYd/5WNq68JXAhiq2M54sKQ86sX3qLVKMVP9jqTrSsYK1oa3NmtNoD?=
 =?iso-8859-1?Q?GHUeX2IpM1YSLRHDfsg6U9Dk55gdmOmRcPK59Pv96rwfHuuCiEoaBkLvGU?=
 =?iso-8859-1?Q?NhW/r1GPmUyoKCtEnMfjdMedNTEa9u8PoXuMb94T7tP3LlErKS4LKoE5jh?=
 =?iso-8859-1?Q?z0ZjVYy5Q9WhYJsZDl4hQUk39qGIenilaTOAurM7ewpnVi2KhXhxc4IkXR?=
 =?iso-8859-1?Q?4WWScj7Aejv73MYfmnR6hG8gzxUmuDAFN+Ud+qyOGM06yQUvOnlhyvt2IF?=
 =?iso-8859-1?Q?mPKJfVccK/L8lN5lwbu7KQKfOqTjJjpfQz3+0fwwZpeJ37wY3qcvLaBG+B?=
 =?iso-8859-1?Q?TU0R7YGj5+QgB/8it847NGs/CS3cv4hrdqUvcdKnShzCaWdmGzTafwUarl?=
 =?iso-8859-1?Q?mTYQH/wUZZTOLguQvtqyuFEQcD0QXT1u5qUveIrlVaUJHvhdJvqV7smzjT?=
 =?iso-8859-1?Q?nnG7XG3Rb/mGfrzOxFQ2y9SPgsgTqoABnuFOSCoygY0SSCGjYiNz1AqUzA?=
 =?iso-8859-1?Q?ZoQWQSfmWqJJV4kUninzc6rWLRkC3RpO+dtYTN3YTK5i8ZHa+K18uVela8?=
 =?iso-8859-1?Q?RITCGxNC4t8ffHoSHXix2875uPIssEuHNss4uVYEkjO2MJa7sRCvl/Hp7c?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?FBevc1K12KEey2RWO+cpy5qlIoJBd1OeR4hutvcHyX8dl+HCY+OQRDJ8xu?=
 =?iso-8859-1?Q?g0s0t4zJ+3Bfh2fiGNdwZQhPMTYosOETr5R/dQO/9BASRmjwh1PMI4gH+m?=
 =?iso-8859-1?Q?iit6ov/VQ8K5GUHuUCX7NV/ZvZL4Fzb9mu15CHKqjha52T1Kwf2cSqM3Y8?=
 =?iso-8859-1?Q?5fJb6fMpNyRyTVL94ocxSkDQ6FB39SfDPI7fDHISTcpYT+RhTUrpPH46V8?=
 =?iso-8859-1?Q?n/CxlEIPRKCP5bb4Pi/zVwb7nVWHY09d/zzofh+UCmsSSgGJ7fnpZuJRLx?=
 =?iso-8859-1?Q?aPAoOmKekSBLN8vZn40+FPS+twVh/+XMfz0l5NHUjTV0tJEupvDWN25aYp?=
 =?iso-8859-1?Q?K+4pVa1nSQWjm5EefM4oarT3a87dj+kNmyon0VPawstpDP+DbookwNQMTG?=
 =?iso-8859-1?Q?dpRJH3TRxW3r21waVEx9F9Pgn86p94wdLaarAgZE96uyxmzi7HzywQdbzq?=
 =?iso-8859-1?Q?8VP9HZoEaRBI8f9KibP1vIjT3ad8Rt12Qs/QF2bwccKSSDOaU/O5PjszwN?=
 =?iso-8859-1?Q?S3g2h58UK3UKmDb/Yp2P/Y0j5CGc+kGu+Lij+Te3h3klnbTHarVeHxZTqA?=
 =?iso-8859-1?Q?yhMkt9AJfosOtVIQcSKsdxtRAzIPPEod7T04tVkZIW6LchhPELzn8+t2Gy?=
 =?iso-8859-1?Q?FfhnjbqlNx+MurG2zBJ+nYnWA77VomQTDR3sGtyyzRQB8sjEyC+H3BvpRk?=
 =?iso-8859-1?Q?3fQms56F9Ge96VHUh5sRC+CWC2thLnuvIo4gvQRcGRFeprwfgIuCpKXoSv?=
 =?iso-8859-1?Q?NOxUBtghWMWREZAkMUS/Wx3d26FO5H/llE4OHFBYoaPvtwO4feoec0G4vB?=
 =?iso-8859-1?Q?EzV7/zmCs1nFNLt+BYgrQ88cM3DrxcCY5SNl4BdU/OVE0s/fscB87YAEa2?=
 =?iso-8859-1?Q?hOYu2r6c4f/3kSEAWW8HA4L7dfd0HOncxr3zHw+fc9Ag6jgJXjjxG1o35s?=
 =?iso-8859-1?Q?lSIxfpgTxoboGL6KmgUgcI8K6mjGL0Jrj5WBFLn/nGk76sYhmgK2XaXpet?=
 =?iso-8859-1?Q?WDxajV6B0zVVjU/q2JIKpNe/r1TVpTKWdxg+6uxYiJPSdrzsCg9pPs6u3w?=
 =?iso-8859-1?Q?gIApja5RtGxuKvuPJeizwBIS88jZ2X+M+H0aS4zhMMRsuZdf2bNFt29khz?=
 =?iso-8859-1?Q?QNGAuukE0VnO+B57qrZV8jTPFAiIef1+sDt4f4rU/SjsSbR8EE8WBbzeB3?=
 =?iso-8859-1?Q?/j4HZt3x+hYLnWxOSDfDAgpycpEigCrhJoKLv2dvWsXbGRmxMU/m9k+stC?=
 =?iso-8859-1?Q?GQQxdYJiv/4mK5AUmHTTfxgbnu1N4yJ8glf+O9Zmt34J7hr7h8mB96zm5M?=
 =?iso-8859-1?Q?4BMFFm0h0LfqFOGBWt0EHiEJydahbfq0a0OBHM0dfqbXLsxyNOvSS6oAag?=
 =?iso-8859-1?Q?D1hdEEVx9acDr4usbl3YfYVGJ6HkjvaH3PzE3nMgPDZY6zK/bvN13k4wVN?=
 =?iso-8859-1?Q?jQaM59UVWLwKs5IXPztEMAd3LPM7+Xo+C4E48gddTVzkjHag+V2LXGOyZd?=
 =?iso-8859-1?Q?q98bh7+pUgAaUM53JXpRs3amFbI4Jix59G4H9W62RqgpwxyeytPh0JmC1f?=
 =?iso-8859-1?Q?V8Z8QGhnIcEADcmjPOt8NfApU6uzUXqbHJdivIO7Xhc7hMfeE6Ql7YXYQb?=
 =?iso-8859-1?Q?3Jt8buelGQJppS7nPquOQ8T3FvG2ackk3e2TSwqI5SlqsMDvXomCfRPg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+Q5a6BAJNGFFlpO9GWGMCsYqWfGdnnadhN+HBL3/G4NHgw/1YAZTmp8BMjypjkY0psW/1anHUWI/0g2lcQyGtlltTHrazISvYC8XE1rgJlMjjgYcXLTZpWsvRQH7EbsF1Xs9YpXni+hKnpY0wMV9Rj0idcTW1uDHEpRvbAWcBzcJXoPwf3BPa+HEnYBwJV4oSrrb992UaLSmuHvEeFJ+INo672vv02Yr6rKNyGnUvY1Zw6CPsNMPGp/QTEax8IWGBpZpDmG1bjxKYKa7xuGGZx6CZAPI7ZL6lT/nG51JA5GFDKup6YSCpnBm0bSucxsgwBqaiKyriaBJR3Fkg2Cqjlohle9H2wCgzCgHZsG6gLlVOtrGcI1nu0bA3N06LhVs6gyK3iXf9gfIYIBrbc1c1Y37CVSKvvRdsmehguM26H64Ibf8B3+36cN3y19W2CwyMoyns7UbVcfwyUI1/REk1Nw8aRZhRGxVhR7ze5xyPEwhQxfW9smm1jy5TLWo0TnkOdfgqLoJmN2EZ3s6lguKER6r8ZO3aBlrq4IdANWgnoPzGCkvRyktlAphzSVXO+8mhKof2e+KGeg7Uekpo2xKNanQfW7b8scMHHDc6+W01mE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436583e6-ad77-4bb5-70c0-08ddbe452cda
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 17:30:47.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HN80a4+AuzZf8YdhR4Xia9Ar11dH57lc7t+Jkl6t00lFIME+uqd6zeWnvUBc6hV/lS4VAz6nVOj7RBTLPfIES5035/RZ+FSVWkkYfrWlLpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7599
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507080148
X-Proofpoint-GUID: XHLqlbnKSNenau0ZkapzAky-ozStUAvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0OCBTYWx0ZWRfXy668N8RrfOsN oIq6txPOhSBV1VYpg/igk7Iqp5ftHHdcD5RlhtR0prGrkTjq9gtyp/hO+jNb1PSQCSD7nb5SXWL +4N4CJgnRTtyp5IM4vDjcWkXY/5tUtUkjjw2yfcatcKL29tv0LiIeJONVuyzd950wqo1Q2aErjr
 Rd26TXWYs5jbT3RqmS3ybCadCAPqGnT5iVgwvkjKOxH/dxfQEFYQYUcSLO/OM+VIuY7Nj0TTIFP BQSpthLRdeX9qLISBgDA5EHCpLQhYNyy2xu0Vc5UkVKhIkhZ+m8xAbq8rdCdXB0fZeyUlcS/RIV +ya38H7OI+Bux3Z/9VhLZjF/EsmmDzsSL2qk0/6JGvxNevpfQo3r1JcCoguaPARxgjCVb8PdB/N
 lLFQ8DeDH9/7AiHvbh/CQmDuDvTlNjFlL7ynb+csBP46wUuSwJ13rcr7iu2si9gYQDe31R9p
X-Proofpoint-ORIG-GUID: XHLqlbnKSNenau0ZkapzAky-ozStUAvS
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=686d55cc b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=fOXqtA1guzip3gomZ7MA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Tue, Jul 08, 2025 at 06:19:25PM +0100, Alan Maguire wrote:
> On 08/07/2025 02:34, Kris Van Hees wrote:
> > On Mon, Jul 07, 2025 at 10:51:10PM +0100, Alan Maguire wrote:
> >> On 07/07/2025 20:55, Kris Van Hees wrote:
> >>> On Mon, Jul 07, 2025 at 07:14:35PM +0100, Alan Maguire wrote:
> >>>> On 07/07/2025 17:53, Kris Van Hees wrote:
> >>>>> On Mon, Jul 07, 2025 at 05:32:19PM +0100, Alan Maguire wrote:
> >>>>>> On 03/07/2025 23:36, Kris Van Hees wrote:
> >>>>>>> On Thu, Jul 03, 2025 at 04:59:44PM -0400, Kris Van Hees wrote:
> >>>>>>>> On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
> >>>>>>>>> On 03/07/2025 20:03, Kris Van Hees wrote:
> >>>>>>>>>> On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
> >>>>>>>>>>> On 03/07/2025 19:26, Kris Van Hees wrote:
> >>>>>>>>>>>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
> >>>>>>>>>>>>> On 03/07/2025 18:06, Eugene Loh wrote:
> >>>>>>>>>>>>>> On 7/3/25 12:59, Alan Maguire wrote:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
> >>>>>>>>>>>>>>>> patch 3/4 feedback).
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
> >>>>>>>>>>>>>>> send probes?
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>     dtrace: failed to compile script /dev/stdin:
> >>>>>>>>>>>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> >>>>>>>>>>>>>> inet_ntoa arg#1 (ipaddr_t *):
> >>>>>>>>>>>>>>     Unknown type name
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
> >>>>>>>>>>>>> need to add it to the core set of typedefs and add a type for a pointer
> >>>>>>>>>>>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
> >>>>>>>>>>>> this I believe?
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Unfortunately the #pragma include doesn't do enough; it just defines a
> >>>>>>>>>>> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
> >>>>>>>>>>> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
> >>>>>>>>>>> typedef to net.d and doing the pointer lookup/addition but that doesn't
> >>>>>>>>>>> work either. Seems we need the core typedef + pointer addition or we hit
> >>>>>>>>>>> this failure.
> >>>>>>>>>>
> >>>>>>>>>> Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
> >>>>>>>>>> you should be set.  That is what I did in my priliminary tcp provider impl.
> >>>>>>>>>> I do believe that works.  Either way, we use inet_ntoa() in the ip.d
> >>>>>>>>>> translators and that works with that typedef in the file, so this really ought
> >>>>>>>>>> to work.
> >>>>>>>>
> >>>>>>>>> Yep, I tried that in the v2 patch series; Eugene hit the undefined error
> >>>>>>>>> in one test and I now hit it consistently for all tcp/ip tests
> >>>>>>>>> unfortunately with "typedef __be32 ipaddr_t;" in net.d.
> >>>>>>>>>
> >>>>>>>>> My assumption (probably wrong) is that the include of the library does
> >>>>>>>>> happen but nothing triggers the pointer type generation for "ipaddr *"
> >>>>>>>>> in the CTF dict. If there was a way to force that type generation at the
> >>>>>>>>> .d file level that would be great, not sure I see a way currently tho.
> >>>>>>>>
> >>>>>>>> Well, like I said, it does work for ip.d so I don't see why this would be
> >>>>>>>> any different.  I'll have a look and see if I can figure something out.
> >>>>>>>
> >>>>>>> Looking into this more, I think the problem is simply that you did not sync
> >>>>>>> all the dlibs for the various kernel versions with the updated ip.d, net.d, and
> >>>>>>> tcp.d files.  So, if the kernel on the OL8 instance you test on does not have
> >>>>>>> your change, it will fail.
> >>>>>>>
> >>>>>>
> >>>>>> No, don't think that's it; the .d files that matched the kernel I tested
> >>>>>> on (6.10) were synced; the use of the 6.10 .d files was visible in the
> >>>>>> error message. The problem appears to be around the fact that tcp.d uses
> >>>>>> the ipaddr_t * in inet_ntoa(), but unlike ip.d (which uses ipaddr_t in
> >>>>>> translated types) it does not have any other mention of ipaddr_t.
> >>>>>> Adding an explicit cast in tcp.d to the argument to inet_ntoa() to
> >>>>>> ipaddr_t * resolves the issue without having to add ipaddr_t to the core
> >>>>>> type list.
> >>>>>
> >>>>> Can you reproduce this at will?  Can you give me specifics on OL version,
> >>>>> kernel version, etc?  I'd like to be able to reproduce what you see, because
> >>>>> so far, all I tried actually works once the ipaddr_t typedef is in net.d.
> >>>>>
> >>>>
> >>>> Yep, it's 100% reproducible for me on an upstream (bpf-next 6.15) kernel
> >>>> + OL9. Moving ipaddr_t to net.d works for ip.d but not tcp.d in that
> >>>> environment. The extra casts for the inet_ntoa() parameters that I
> >>>> mention above are needed in tcp.d to get things to work properly for me.
> >>>>
> >>>> I pushed a branch to
> >>>>
> >>>> https://github.com/alan-maguire/dtrace-utils/tree/remote-tcp-v3-wip-broken
> >>>>
> >>>> that illustrates the failure.
> >>>>
> >>>> Relative to devel, it consists of 6 commits
> >>>>
> >>>> 1: the v2 of the remote IP address change (ensuring the remote address
> >>>> tests won't fail);
> >>>> 2-4: a few prep patches for the tcp provider; and
> >>>> 5: the tcp provider patch (in a v3 work-in-progress form); and finally
> >>>> 6: the top-level commit then removes the casts I added to tcp.d in the
> >>>> previous "tcp: new provider" commit. With that change in place on my
> >>>> system, the previously-passing IP tests start failing.
> >>>>
> >>>> If I "git reset --hard HEAD~1" on that branch (reestablishing those
> >>>> ipaddr_t * casts) and rebuild, the failures go away for me.
> >>>
> >>> I tested your tree on Debian with the 6.15 kernel, and this is the result:
> >>>
> >>> $ uname -a
> >>> Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
> >>> $ cat test/log/current/runtest.sum 
> >>> dtrace: Oracle D 2.0
> >>> This is DTrace 2.0.1
> >>> dtrace(1) version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
> >>> libdtrace version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
> >>> Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
> >>> testsuite version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
> >>>
> >>> test/unittest/tcp/tst.ipv4localtcp.sh: PASS.
> >>> test/unittest/tcp/tst.ipv4localtcpstate.sh: PASS.
> >>> test/unittest/tcp/tst.ipv4remotetcp.sh: PASS.
> >>> test/unittest/tcp/tst.ipv4remotetcpstate.sh: PASS.
> >>> test/unittest/tcp/tst.ipv6localtcp.sh: PASS.
> >>> test/unittest/tcp/tst.ipv6localtcpstate.sh: PASS.
> >>> 6 cases (6 PASS, 0 FAIL, 0 XPASS, 0 XFAIL, 0 SKIP)
> >>>
> >>> I will try to get 6.15 on an OL9 instance and try there, but either way, I
> >>> have a feeling there is a binutils (libctf) discrepancy somewhere?  What
> >>
> >> could be; see below..
> >>
> >>> version of binutils is installed on your system (nm -V)?
> >>
> >> $ nm -V
> >> GNU nm version 2.35.2-42.0.1.el9
> >> Copyright (C) 2020 Free Software Foundation, Inc.
> >> This program is free software; you may redistribute it under the terms of
> >> the GNU General Public License version 3 or (at your option) any later
> >> version.
> >> This program has absolutely no warranty.
> >>
> >> Let me know if you need any more info. Thanks!
> >>
> >> Alan
> > 
> > 
> > Tried it on OL9 with 6.15.4 kernel, and aside from some probes not firing,
> > the tests work.
> > 
> > $ nm -V
> > GNU nm version 2.35.2-63.0.1.el9
> > Copyright (C) 2020 Free Software Foundation, Inc.
> > This program is free software; you may redistribute it under the terms of
> > the GNU General Public License version 3 or (at your option) any later version.
> > This program has absolutely no warranty.
> > 
> > So I think you need to yum update your system?
> 
> I think I may have found another clue to why it's happening. I tried on
> a gcc-toolset-14 -built system, with
> 
> $ nm -V
> GNU nm version 2.41-3.el9
> Copyright (C) 2023 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License version 3 or (at your option) any later
> version.
> This program has absolutely no warranty.
> 
> 
> Now I can run the following fine:
> 
> # build/dtrace -n 'ip:::send /args[4]->ipv4_protocol == IPPROTO_TCP/ {
> @c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count(); } END {
> printa(@c); }'
> dtrace: description 'ip:::send ' matched 2 probes
> 
> However, if I add a syslibdir path - as the tests do when they execute -
> I see
> 
> $ build/dtrace -xsyslibdir=$(pwd)/build/dlibs -n 'ip:::send
> /args[4]->ipv4_protocol == IPPROTO_TCP/ { @c[args[2]->ip_saddr,
> args[4]->ipv4_protocol] = count(); } END { printa(@c); }'
> dtrace: invalid probe specifier ip:::send /args[4]->ipv4_protocol ==
> IPPROTO_TCP/ { @c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count();
> } END { printa(@c); }:
> "/home/opc/src/dtrace-utils/build/dlibs/6.10/tcp.d", line 183: failed to
> resolve type of inet_ntoa arg#1 (ipaddr_t *): Unknown type name
> 
> using -xdebug I see a lot less types added in the error case; i.e. only
> the following are added when processing .d files:
> 
> libdtrace DEBUG 1751994411: typedef conninfo_t added as id 2147483678
> libdtrace DEBUG 1751994411: typedef netstackid_t added as id 2147483679
> libdtrace DEBUG 1751994411: typedef ipaddr_t added as id 2147483683
> libdtrace DEBUG 1751994411: typedef in6_addr_t added as id 2147483695
> libdtrace DEBUG 1751994411: typedef pktinfo_t added as id 2147483697
> libdtrace DEBUG 1751994411: typedef csinfo_t added as id 2147483699
> libdtrace DEBUG 1751994411: typedef tcpinfo_t added as id 2147483701
> libdtrace DEBUG 1751994411: typedef tcpsinfo_t added as id 2147483703
> libdtrace DEBUG 1751994411: typedef tcplsinfo_t added as id 2147483705
> 
> 
> versus the good case:
> 
> libdtrace DEBUG 1751994399: typedef processorid_t added as id 2147483677
> libdtrace DEBUG 1751994399: typedef psetid_t added as id 2147483678
> libdtrace DEBUG 1751994399: typedef chipid_t added as id 2147483679
> libdtrace DEBUG 1751994399: typedef lgrp_id_t added as id 2147483680
> libdtrace DEBUG 1751994399: typedef cpuinfo_t added as id 2147483682
> libdtrace DEBUG 1751994399: typedef cpuinfo_t_p added as id 2147483684
> libdtrace DEBUG 1751994399: typedef time_t added as id 2147483688
> libdtrace DEBUG 1751994399: typedef timestruc_t added as id 2147483690
> libdtrace DEBUG 1751994399: typedef lwpsinfo_t added as id 2147483695
> libdtrace DEBUG 1751994399: typedef taskid_t added as id 2147483696
> libdtrace DEBUG 1751994399: typedef dprojid_t added as id 2147483697
> libdtrace DEBUG 1751994399: typedef poolid_t added as id 2147483698
> libdtrace DEBUG 1751994399: typedef zoneid_t added as id 2147483699
> libdtrace DEBUG 1751994399: typedef psinfo_t added as id 2147490324
> libdtrace DEBUG 1751994399: typedef conninfo_t added as id 2147490329
> libdtrace DEBUG 1751994399: typedef netstackid_t added as id 2147490330
> libdtrace DEBUG 1751994399: typedef ipaddr_t added as id 2147490331
> libdtrace DEBUG 1751994399: typedef in6_addr_t added as id 2147490332
> libdtrace DEBUG 1751994399: typedef pktinfo_t added as id 2147490334
> libdtrace DEBUG 1751994399: typedef csinfo_t added as id 2147490336
> libdtrace DEBUG 1751994399: skipping library
> /usr/lib64/dtrace/6.10/udp.d: "/usr/lib64/dtrace/6.10/udp.d", line 10:
> program requires provider udp
> libdtrace DEBUG 1751994399: typedef tcpinfo_t added as id 2147490338
> libdtrace DEBUG 1751994399: typedef tcpsinfo_t added as id 2147490340
> libdtrace DEBUG 1751994399: typedef tcplsinfo_t added as id 2147490342
> libdtrace DEBUG 1751994399: typedef ipinfo_t added as id 2147490350
> libdtrace DEBUG 1751994399: typedef ifinfo_t added as id 2147490352
> libdtrace DEBUG 1751994399: typedef ipv4info_t added as id 2147490361
> libdtrace DEBUG 1751994399: typedef ipv6info_t added as id 2147490369
> libdtrace DEBUG 1751994399: typedef void_ip_t added as id 2147490370
> libdtrace DEBUG 1751994399: typedef __dtrace_tcp_void_ip_t added as id
> 2147490371
> libdtrace DEBUG 1751994399: typedef caddr_t added as id 2147490380
> libdtrace DEBUG 1751994399: typedef bufinfo_t added as id 2147490382
> libdtrace DEBUG 1751994399: typedef devinfo_t added as id 2147490385
> 
> So it looks like sched.d wasn't processed for example, but weirdly in
> the failing case net.d (containing the typedef ipaddr_t) and tcp.d were.
> 
> The actual error comes later though, after processing kernel/module BTF:
> 
> dtrace: invalid probe specifier ip:::send /args[4]->ipv4_protocol ==
> IPPROTO_TCP/ { @c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count();
> } END { printa(@c); }:
> "/home/opc/src/dtrace-utils/build/dlibs/6.10/tcp.d", line 183: failed to
> resolve type of inet_ntoa arg#1 (ipaddr_t *): Unknown type name
> 
> And so I checked for differences in the build/dlibs files versus what is
> installed, and found none. Maybe the above might help reproduce this at
> least. Thanks!

I'll have a look, but when you are using a locally built dtrace, you should use
./build/run-dtrace so that the correct paths are set up for libdtrace.so and
the dlibs to be found.  Otherwise, you end up using the locally built frontend
(dtrace) with the installed libdtrace.so and dlibs.  And even when passing
the -xsyslibdir, you still end up using the installed libdtrace.so, so your
testing is not based on the locally built dtrace.

	Kris
