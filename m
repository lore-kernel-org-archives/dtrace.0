Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7351A60B8A
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726742831; cv=fail; b=EcUy625W2xb5KoyEYs/EVfFZwpQATcOcNzz9bwCSGnqj1c8yIe+Wl95/zWLL1E282QADCM4Z905ubv1ZUJY88HeT6CEvelx5KCK8+j65GtHjR/kG/f9etJrLv593JGesPxsXv9b+9W6cvokjr2FMT4aSbh3X6Mxwj3jvg3iEPJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726742831; c=relaxed/simple;
	bh=Bw4JHhWFcfqJ4W+peeLzqNTcUscPq8x81OhLZ1dX0GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m4yhlcvFOLdPrBshr799nqUkMh5qB+Ig/1E6WUFTrOfLaBx+qR5vJE63M4Ip0MCf4HAFpu0i5G1T1VqxUTCoq7Hs5lBlMyOzYf7cm1vsNhw5wdPcSAlfbbLc/KsqBpcZ6RWnqHxYhTCi+yYfJ1C4zpEgdO35fW9+Lyi5txZHnMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UYL7OAxA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SKyUA0R8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UYL7OAxA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SKyUA0R8"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J7tWek001479
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 10:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=0qgS4OUPs4WpHJa
	98uYdV9Ab8N3KXunNImVk6HJe0bM=; b=UYL7OAxA3kibBfvDTIPcg4Hi/CPjn6B
	8g+C0mCPYm3Jt2Wz/8AkLBadNyoxV6o6xDf29RarXqZX44q5gkrYV+MLR0zLW3Xy
	7UNzYMfP5S22jMs0iAkGjhjTRPXL1o/Tg8kdnfWe8ePjp8vvAEOXED7GkmBfrZYA
	QsNulegQgkRWzCyHxpghe4iwZOwQhKqvwt0Q0x8mzz+0ZDzpIgsZZRbAF/uKS7YA
	iVmq0tMY5/LRgD4w0CibApL0NJfAlXf+iEcG6v3UovH5KHB/nANDhsJ+sTUyB0LX
	iMxJZZQTLGvddeznhVv8/NJOH8HD84gtgOtoKKEuJrKVwHGrdIGruPg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3rx3mkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 10:47:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48J9iKD7018599
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 10:47:06 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41nyd0atwy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 10:47:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0MOyZGtTSoExlfR+l9+zVhW3HFcqZR4esYKzMr7fGyR4b6f2DwtLVCsfL8/bfYzXPs0GwSJnXZ+XioolDyu/RRt9gC9cSIt7KA8glx2CeQCVq6iL0GuyMhwrAP7pZExzS+Bpkhpl641qjCighDoe1lsInOXr/XJ6nYGQoaxpU6WNHeS7A0zhoX4qrIeq1YlCrfy9jsVMPtvMa2WzR+0eDG/yg+klvxAJusGwDYftjm3X7eea9JgUmkMLOaOBvfnomNqml2UEaUys8p0Ayqi/iIuFoTxZWQnTEBP+KOlsoFjr+K+e+iwRhGW544G6VK95whqKajrJHglfstsj+6DDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qgS4OUPs4WpHJa98uYdV9Ab8N3KXunNImVk6HJe0bM=;
 b=PFlLSSDCtF2/pe6t41yXoGKN5DVCMmnuy3GsXt4hvIk+3dn64DGXHiDwlh7Sx8motXq9cju+WPl0U1cIsFtLB6kLt4j6qVfClx2XYLVOYsfDFDVsXLosOBz66WEgL/RgCoAKyqe9i2AuDkv7FEaDpfH+Wcx3IcuWAgkeJNGP/RC4AP8x1zO61sQrz0r3nQzFulkxJidHaG3M/Jd1cV55tSXS/IU1pA0w5mhyapyXc0RjGWFJnST0Ypx9zzt174qGaVuxL7eIfuR6zvaSXUZLQiErV/MVbjOzGWyl07+gBSFo35gNLrSwFeWz9g880hXbnCRmch3RX6z5Is1TRpdidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qgS4OUPs4WpHJa98uYdV9Ab8N3KXunNImVk6HJe0bM=;
 b=SKyUA0R88gxe2NXtYPqS9fux/vm7bG4KHOcLwBxRwTCjlwoMfVyhlXBIz5Nq5F/cfldrEyX1Zp0V3DbNFZqkgFvDyY2LzWyAb6spxC1qINhIQ024J0hoWTxb9wBsGx4ra1VO8CsHpvhF/G+d6gej/LYkY+ZfWoFMws5UogFiXWM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW6PR10MB7660.namprd10.prod.outlook.com (2603:10b6:303:24b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Thu, 19 Sep
 2024 10:47:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 10:47:04 +0000
Date: Thu, 19 Sep 2024 06:47:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v6 03/19] Deprecate enabled probe ID (epid)
Message-ID: <ZuwBJiHt5Mvy7k6g@kvh-deb-bpf.us.oracle.com>
References: <20240917180812.18686-1-eugene.loh@oracle.com>
 <Zuv1f6ox50FDGD2K@kvh-deb-bpf.us.oracle.com>
 <Zuv8JDHTFrZCI8Hj@kvh-deb-bpf.us.oracle.com>
Content-Type: multipart/mixed; boundary="3QesaU6XHEEZGsV+"
Content-Disposition: inline
In-Reply-To: <Zuv8JDHTFrZCI8Hj@kvh-deb-bpf.us.oracle.com>
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW6PR10MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5c7e55-6098-4b62-aa5e-08dcd898663b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JRfSkJWNSoKj7E4akkT8O1t+6lVHY7Y13S0spvV3p69PQ0wGtm8ZhA0Ik8DR?=
 =?us-ascii?Q?VHbdL3D76rr9A/564YjVZUpgCXakdovPh/OLjGF4qNbAOuNFb1HFhDxSYntq?=
 =?us-ascii?Q?bry1CMyBCOG1S2jE1xe3WCsfunLVxrs3dJmSqdqp1K2IAmfxDMqBk8L4Y/MO?=
 =?us-ascii?Q?5VOaCZW27lkrRBhDLgKJeLz8amz/6WRVH9ZBLjmPMzXK9rm9sPAIPIYIoRiJ?=
 =?us-ascii?Q?R9+uY4pU8mRuCq04bUGP2whViv2ymsA46OdWqRr74oxd7+F3SNNbJV8jf45U?=
 =?us-ascii?Q?Gw7xvBeBUoOeki8qePqqkbeK1XUEaWggdlHbGXnkLINilpbL7ygioron367X?=
 =?us-ascii?Q?//PsTsw9rYijyxiFxupJoYt8KKa+vmdHpjSLgY8XFI/BCUZYyCqLqnQQR+Xl?=
 =?us-ascii?Q?MLoGqMAGLjj/V4wcubMbjzzkqmO9AwMFPRNVr8wam3pbwLzeW7rOJIjAK+NO?=
 =?us-ascii?Q?4Oo6zwZeCS7es5u4/EUWpkYWFKC4M7hPqRrYT/CZ2FubO4nZ2ZMT5CuzWNWb?=
 =?us-ascii?Q?FbYyZ/wseRf4BNETxPb+6dzN5Y+oEzwHjwk87+uUbibROk8G9gMMsPRtGi1y?=
 =?us-ascii?Q?W1gMUYFcZbHMAfNY57m3EXVnbJhW3q0L3PjNt8toAHsSct4Qv6W5qP3TWI5S?=
 =?us-ascii?Q?9GFrvoxGyiqJjkI+aLEZG/Zqu2+2/UuXr9j7alZHuCkc5qidh736vOe6Q0jj?=
 =?us-ascii?Q?aX9ol8KECEGUMskYEwfM8A5UDffoVUEGdblxyjvq5FmAsk+kE1rq47iS/zUs?=
 =?us-ascii?Q?b0LtADqV/zVW6xdbzdBAeLpLWXg0vjRhW48vWbzRftuKAU4XiimfJMUvmV8V?=
 =?us-ascii?Q?AhNxPwXHMIJI8fTaefUXfAyZAQN5KyUmod80OmUXghFEURtY0CfOxPPikRxO?=
 =?us-ascii?Q?31YRhFgwKaZaiozFQGf8FHHOIOYCuDJaWYOcjzxbJjhW8yLYqwSzrestUT8l?=
 =?us-ascii?Q?JeGJ9FmMUWCJImSssxB/m/hqaMLPleXdI0hT/mBaeIf5gjMyfQ3gcOWv3TSd?=
 =?us-ascii?Q?oumLkW7eUvUjc+PnOln3VMpnkDJApvjPqctdaJi7dS8tdTBLfvRKFtzs7d/X?=
 =?us-ascii?Q?nYJ6lFYTBMYT3HOuarFrkEaVH6nRDIduhMuCUOwC761euVMFQd1k00WZSNtc?=
 =?us-ascii?Q?iq0Hs6Y/FDMXchJJkYxmcqyD2lN7qXwpfpGSxB8zAkL41Dk8yuEL7gC1Dovk?=
 =?us-ascii?Q?UUqjQkoh/0wPYUHdjXa99uFhCZIp5Zxp2JI4flb22KwS5o9PksizfF9dWLGX?=
 =?us-ascii?Q?L/wyjk2naxJ/CpzXsi0C1rWHoZqSItOOn25amciBVX8FtFjyH8Upiy9zsrfP?=
 =?us-ascii?Q?OGJqHFUDIZCAXooC6wuMK/4TC/RF6HspMB+5c4/Ll/0Y5Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ddujHdr+eT7sLf79kmXT6JJxGJzKVR56Dneo0RjvauDUDhg5qKnaav8jIBlm?=
 =?us-ascii?Q?xj6WSAXLyt0Lu+NP+xDUb39Pt6sAO5QRTtdfUoYz1HrhoBRyWo7vLNQv60+e?=
 =?us-ascii?Q?pOpUackEHzFMVIFiMs+H+w4EJ2Xs2ZZHVUHa2S+mifTy5F33Zncbb+UtL+RT?=
 =?us-ascii?Q?Si4jgphXnt+ehypgr7/MpfNp0Ku3WAtHGcYbLotgvkWYkbV0NZ+L7Yvju6rC?=
 =?us-ascii?Q?SiosT6B/zRZwH2dp7C2AMtdHjKr2x6udZNAiLGtsw8jVGa9gMO9qRq9DkK0r?=
 =?us-ascii?Q?folSJt5fuVCeBdzKK9A58yCsK+DOK7hGpQUcwyHqD/vmhmjJQc+WQnN2T53E?=
 =?us-ascii?Q?BdGFl29rULhENyelb1SjDKI5wK6QVfp5Kop3QZFX424RW+76wE4HzYhB0ICb?=
 =?us-ascii?Q?og/vM034gr6BzMMJ/ia/ngfaXhP1OhZoBAk6x0DwKZv3w6OEeTsodmUfnuxl?=
 =?us-ascii?Q?XVJuxoITjZ8JGLhjS+KFgTxCzErtdkqDJcNUrMHlFRwcybk2JeFILpag8Gjh?=
 =?us-ascii?Q?K0tN8nfL819nmZY73Ctzk64fXQjFICA8vf/kP+steeezSS189YY6h+I4hYTz?=
 =?us-ascii?Q?qyX7MAi5nLNQLxNae8Er7KiqUpvlpcLBukbNL8GUHgN/VgVAx11SfLEF1Y4W?=
 =?us-ascii?Q?ITJBsOcmnOZ2FZehzA0ukjLbMJietB3o5twYBXHF3JlG3Q+CfhHIu6qU4/4B?=
 =?us-ascii?Q?FAPiumrO0oRYeJ4uHPYcZuP5DX6/IUBAPZVvjB757kw/OjORvxw+Rd1ak3wx?=
 =?us-ascii?Q?JbfqLl21UaOJXE9G1hmbxSbR4dWSHewNo7JOVMcJCcjjUKP2UafjKCf7xiP+?=
 =?us-ascii?Q?K6lPQwlpW/igiiFCdQBok0KNQ8M14GwVGhUkGn3hu/yG3llrZlvhFvovyMra?=
 =?us-ascii?Q?Sk9FUre8JIWM5s2sDbtM+z/LnxvrxdjcjQetsqSx3YDzxvO1+SWsg7tgkcu8?=
 =?us-ascii?Q?lsWXBvOsmvELeqn6Ack9HLDzmJLVgdr4kGCMWvx3S3Fm1T3YgLNkjBj3MTm4?=
 =?us-ascii?Q?/RTvg6MNO/Rag1ptNmpgBkeL6TkuPwMJXh5sBFXMSiJ9AvLctSxNo8MEsTF2?=
 =?us-ascii?Q?C0FdEInwy9/JRI/ww1goEbL/fIt6ahSvmQilYqaS7eUFDoRc5+Okt/75XfOf?=
 =?us-ascii?Q?oc1Xlo7qS7ZwxabTNWdw1knTUQ835clFjCFO5RxpOOqGYH4+ZxHvOk+gTgw1?=
 =?us-ascii?Q?2aXa4fquDlhhDI5OdBMIRGKHjIsMVgkTukwS/bFJurRFuegjFbn+f1dIxNi9?=
 =?us-ascii?Q?Fzgb4+gsgb2Rr3h8XXA2Qgcn7ikpBQNorp9wzkFM2yZfm75hqLYtwdWgCwtK?=
 =?us-ascii?Q?ZYHANMrDLoWrQFjBB0Sg21M3LMxVYIucgDFksDLsTKW8sokkqIij0RxOGTZN?=
 =?us-ascii?Q?B/omThYCWnUXCiUoX/mC8BLNrUspMyGiCQWvKX7DR1MzeFi/lFJNGH47UX0G?=
 =?us-ascii?Q?3k3F+FhPCE1DLU5nihDJHZ1ibOFVgaKpekRVHvJaKWzCKrE7tbAV+6/0u9hU?=
 =?us-ascii?Q?zh4NpIHK7tk5fNXm8Arliv0f+4OokulSsUf2eYo769nS8Jh5V6dXysoGXp3f?=
 =?us-ascii?Q?+ZAEz3fgHpclAq+VHqR65sAR3fhfz2EBi270wdmBnIcc3IPv2cFRqB41Tfay?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bNXtNphpJB+V8SNJah4WvczsiuNefQNMiMobKbTTiYq+shX0tDP6x5U1fb3uN54+X5R2J2M8h3ETWYpqaNM51DcHphbmOe1Mc4SmR/b8EE2jd34UydK8+eZBPUuJ3XGPq74+BzNIE4aUwJsfOdPwvgs6mtD5PnaZ3C1fpm9PaLY+x/TUYxLwUOVNWcS01ChIDmoXNm8sDmn1G5ZKptJ3NRb1oaeA6HdndvR+n9CbxgQNiF3YwxuR0HnAIifqc9Wti8z4io1otXBGlU1NxsYePllDT795TKscbmYPylpvIZ/CqMjnuZ+J+xBgZouxdkkSbHgWWVjeU3hHrLQ/XIFGxdl2j58Y/tJRLaGl834GWmc66AXu7JKC9TOMyxv55uZkIe4yLO85gOc2u+ivdubRwaKVB9iqwcdmWQi+eMbEaYJUgI+3Q2K1ONytqkJz54WHe75ZyCfuIM3DJ1TfrtF/c6CyG72YzAmtQ4wI62h8RUN1LtIbIrkl5uszujAgLQHyPA2/EB0Uupvv5UuCMTXJxV4Nh2zwv3r5wIcEDy0IqJ06Fk6v7d051J8QOM8RIsAMMHRSR2Kap5Fw84KBPloln+POZYz/dh0FqHpbxAJojdA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5c7e55-6098-4b62-aa5e-08dcd898663b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 10:47:04.2858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQgqhpxi+4OUVHVAGg3WDypXFECah8IUFKwRe1oBve3TzOBZhaczP/P9apgYdbmIgAs1Wa//GTevFdZZIi/llpV3ZTLGa3zjn3ijKDaaL4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7660
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_08,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=994 adultscore=0
 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409190069
X-Proofpoint-GUID: D6ElKaAyPvGpC3_nkOSadlcWTvjWS-Ct
X-Proofpoint-ORIG-GUID: D6ElKaAyPvGpC3_nkOSadlcWTvjWS-Ct

--3QesaU6XHEEZGsV+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 19, 2024 at 06:25:40AM -0400, Kris Van Hees wrote:
> On Thu, Sep 19, 2024 at 05:57:19AM -0400, Kris Van Hees wrote:
> > Great patch.  Found a few smallish things though that we probably want to
> > address before putting this in (potential risks for buffer overruns).
> > 
> > Also, because dt_stmts is constructed from the programs being presented for
> > loading by the consumer (which is a 2nd step after the consumer uses libdtrace
> > to compile the statements), it is technically possible that not all elements
> > in dt_stmts will be filled in.  There is no guarantee that a consumer will
> > present every compiled program for loading (though in practice that is of
> > course not going to happen).
> > 
> > But since libdtrace allows this by design, every indexing of dt_stmts (there
> > are only a few - marked below) should first make sure that the element is not
> > NULL.

Suggestion patch attached...

--3QesaU6XHEEZGsV+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=DIFF

diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
index 3c118545..da70318d 100644
--- a/libdtrace/dt_handle.c
+++ b/libdtrace/dt_handle.c
@@ -127,16 +127,13 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
 {
 	dtrace_datadesc_t *dd = data->dtpda_ddesc, *errdd;
 	dtrace_probedesc_t *pd = data->dtpda_pdesc, *errpd;
+	dtrace_stmtdesc_t *stp;
 	dtrace_errdata_t err;
 	dtrace_id_t prid;
 	dtrace_stid_t stid;
 
-	char details[30];
-	char offinfo[30];
-	const int slop = 80;
-	const char *faultstr;
-	char *str;
-	int len;
+	char *str, *details, *offinfo;
+	int rc = 0;
 
 	assert(dd->dtdd_uarg == DT_ECB_ERROR);
 
@@ -164,17 +161,10 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
 	err.dteda_fault = (int)DT_REC(uint64_t, 3);
 	err.dteda_addr = DT_REC(uint64_t, 4);
 
-	faultstr = dtrace_faultstr(dtp, err.dteda_fault);
-	len = sizeof(offinfo) + strlen(faultstr) +
-	      strlen(errpd->prv) + strlen(errpd->mod) + strlen(errpd->fun) +
-	      strlen(errpd->prb) + slop;
-
-	str = (char *)alloca(len);
-
 	if (err.dteda_offset != -1)
-		sprintf(offinfo, " at BPF pc %d", err.dteda_offset);
+		asprintf(&offinfo, " at BPF pc %d", err.dteda_offset);
 	else
-		offinfo[0] = 0;
+		offinfo = "";
 
 	switch (err.dteda_fault) {
 	case DTRACEFLT_BADADDR:
@@ -183,33 +173,38 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
 	case DTRACEFLT_BADALIGN:
 	case DTRACEFLT_BADSTACK:
 	case DTRACEFLT_BADSIZE:
-		sprintf(details, " (0x%llx)", (unsigned long long)err.dteda_addr);
+		asprintf(&details, " (0x%llx)", (unsigned long long)err.dteda_addr);
 		break;
 	case DTRACEFLT_BADINDEX:
-		sprintf(details, " (%ld)", (int64_t)err.dteda_addr);
+		asprintf(&details, " (%ld)", (int64_t)err.dteda_addr);
 		break;
 
 	default:
 no_addr:
-		details[0] = 0;
+		details = "";
 	}
 
-	snprintf(str, len, "error in %s for probe ID %u (%s:%s:%s:%s): "
-			   "%s%s%s",
-		 dtp->dt_stmts[stid]->dtsd_clause->di_name,
-		 errpd->id, errpd->prv, errpd->mod, errpd->fun,
-		 errpd->prb, dtrace_faultstr(dtp, err.dteda_fault), details,
-		 offinfo);
+	stp = dtp->dt_stmts[stid];
+	assert(stp != NULL);
+	asprintf(&str, "error in %s for probe ID %u (%s:%s:%s:%s): %s%s%s",
+		 stp->dtsd_clause->di_name, errpd->id, errpd->prv, errpd->mod,
+		 errpd->fun, errpd->prb, dtrace_faultstr(dtp, err.dteda_fault),
+		 details, offinfo);
 
 	err.dteda_msg = str;
 
 	if (dtp->dt_errhdlr == NULL)
-		return dt_set_errno(dtp, EDT_ERRABORT);
+		rc = dt_set_errno(dtp, EDT_ERRABORT);
+	else if ((*dtp->dt_errhdlr)(&err, dtp->dt_errarg) == DTRACE_HANDLE_ABORT)
+		rc = dt_set_errno(dtp, EDT_ERRABORT);
 
-	if ((*dtp->dt_errhdlr)(&err, dtp->dt_errarg) == DTRACE_HANDLE_ABORT)
-		return dt_set_errno(dtp, EDT_ERRABORT);
+	free(str);
+	if (offinfo[0] != 0)
+		free(offinfo);
+	if (details[0] != 0)
+		free(details);
 
-	return 0;
+	return rc;
 }
 
 int
@@ -237,6 +232,7 @@ dt_handle_liberr(dtrace_hdl_t *dtp, const dtrace_probedata_t *data,
     const char *faultstr)
 {
 	dtrace_probedesc_t *errpd = data->dtpda_pdesc;
+	dtrace_stmtdesc_t *stp;
 	dtrace_errdata_t err;
 	const int slop = 80;
 	char *str;
@@ -255,10 +251,11 @@ dt_handle_liberr(dtrace_hdl_t *dtp, const dtrace_probedata_t *data,
 
 	str = alloca(len);
 
+	stp = dtp->dt_stmts[data->dtpda_stid];
+	assert(stp != NULL);
 	snprintf(str, len,
 		 "error in %s for probe ID %u (%s:%s:%s:%s): %s",
-		 dtp->dt_stmts[data->dtpda_stid]->dtsd_clause->di_name,
-		 errpd->id, errpd->prv, errpd->mod,
+		 stp->dtsd_clause->di_name, errpd->id, errpd->prv, errpd->mod,
 		 errpd->fun, errpd->prb, faultstr);
 
 	err.dteda_msg = str;
diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
index 50d0aaa7..9baf94d9 100644
--- a/libdtrace/dt_map.c
+++ b/libdtrace/dt_map.c
@@ -89,11 +89,14 @@ int
 dt_stid_lookup(dtrace_hdl_t *dtp, dtrace_stid_t stid, dtrace_datadesc_t **ddp)
 {
 	dtrace_difo_t *rdp;
+	dtrace_stmtdesc_t *stp;
 
 	if (stid >= dtp->dt_stmt_nextid)
 		return -1;
 
-	rdp = dt_dlib_get_func_difo(dtp, dtp->dt_stmts[stid]->dtsd_clause);
+	stp = dtp->dt_stmts[stid];
+	assert(stp != NULL);
+	rdp = dt_dlib_get_func_difo(dtp, stp->dtsd_clause);
 	*ddp = rdp->dtdo_ddesc;
 
 	return (*ddp == NULL) ? -1 : 0;

--3QesaU6XHEEZGsV+--
