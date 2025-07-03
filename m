Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1194A54654
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557147; cv=fail; b=ZVuQ0g4ICrsgWs7slB3aVaeXa+2Sghf/paAq/wyXBT9mHct/jJcVNB7WyIR1Q9r/nK2TkuhMDqGTXC2UPChKnWIIvBux6JQQ+TMHWpZwcvA76TLBCevepwDuHxHM2bicbDenAzqK4FUSJgFgHX4MgbC3czUbZjmLB1/m1uuKi9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557147; c=relaxed/simple;
	bh=ZvpKRGYjlaDwShF/ECtifOWEMQn7zHIH1g+NlH6aaEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UZwGRsAFMG9O8ljsPS63k8JvaqEkuyP1NljDz8SFUsh9DT/za6As1idhqtD0GIgIj0BwOB/KD55trq73y1WfKrR8Z8pNGrkJib+3lG6bdytwHQ5oqGC67+y4RQo4mCVQxIxWUZZ8Qiq8GVZQvvX/oAGmsZHm4FusLqf3QBdEq2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m9+Bbm+U; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UHcoXsTy reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m9+Bbm+U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UHcoXsTy"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ95A027137
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 15:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=nyrYMImo4FUQDAuPGnNsbsfyarIvhr/TuC2BWuE2hCI=; b=
	m9+Bbm+U15HXvwCzsb4oHF6TdX9vJ55YT9sJbFtXF+odlL/QxPjDjkjzB90RXXb5
	2RABrOdglOO5sPCHEsFtWGAQw/1I5LdUQa0UouhqHRhw5SWMXLEbKE4MXAE9p2a6
	Rl5t3PVY1g65NCMuiu0CIaGa+1z8MbJZOFYbs2WinqJxnvm+wa7Dqq1FsyEyECgx
	zRc1qMMVmnIWb9ha/bjkxnRtT9CHBVCBOtvZ9N0dIe3iY0tXRED7rDMN+xPQhLlx
	jDeSEllp/eEnx8TNgS3Gjt8MklY+Aiogg/0mCP27952KJzXfYSFPpp2VoRMJQgJU
	K089wpYmyeZuJSQf+4QdCw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx9978-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 15:39:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FKkoN024797
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 15:39:03 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucuq6u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 15:39:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBsUUbcb3wGIWqTTzJL1B4mqVDJAAPw+Oz4yvn3u9Tc3Y29F+s/NyJXQ/AFuvySowZ594ibwu1lG4Nc2s1Nj52eorEkTdW40N/2EPv6KAWNwLKp4ShV3Irp59+1KB7tHHjiu5HpOnVeXERlWuurmH+eibWN5r08dKYrurFNy+jKipro7PHQY43Bi/Ty/01XFrnTV0mx8x/XdsP+k43gmXAIuV9w2Vt1KfexmxeQnaFqah6/jedaCrsedIDN+kEUgNVeFUkXooak1Hm+9L9iQ+sioPMrq0RR5J92fQmQk5D4mg99we1MKNoaCyT55KjW3GvNhEMfAkBG5TQDd4smQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGAm35rmjbgbGZFsxgDNH2IaoPkuzBVlSGChBLBXTSI=;
 b=nyfI0jb/ba7M8ncR4fkCxb3OmpEUFQPq/1jY9e5b6MuuysF2d9SRXcR4d+4+RQXedUUJDOiv/Qd0ejdo238YdhiVbMCxHcbj/R7heFeaBm7FhlvSRGOtzozSOf9oen982bhJgcwDqzuCwRsieckW18F7a1GDkCtvX5YQpOhURlViQt5o4VjLthioMsrucK6o5FgjIK6pdf5RDIIVZig1awHJiHsicnGi9HaX0TD17Ph+qBl6YjAsz821pAsIIeS4tG47FB2PY7pLKsrTxFzHCUGmXrtwnYzbvK5TKumGk76ydACg9PcsINUOTn/eAk0QFhJ6hm/SgO77mfPAcMdYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGAm35rmjbgbGZFsxgDNH2IaoPkuzBVlSGChBLBXTSI=;
 b=UHcoXsTy1Zwhslr+vPt6/z4RdGNDpUH9eammC2iZt4WT4KTz1tAPxVkbrJWSzJy9DUfI2dxFGQikRDD5HpKebbYRiQf1B5HonO7OE6KhdV1MszKJSVXyY7SeiDJlI/frjET2HOuCMogqr8W/Utz1PlD955XINNVP+tiabSQEO9s=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CY8PR10MB7268.namprd10.prod.outlook.com (2603:10b6:930:7d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Thu, 3 Jul
 2025 15:39:00 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 15:39:00 +0000
Date: Thu, 3 Jul 2025 11:38:57 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, Alan Maguire <alan.maguire@oracle.com>,
        dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 3/4] dtrace: add tcp provider
Message-ID: <aGakEUw2wYzngot5@oracle.com>
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-4-alan.maguire@oracle.com>
 <8ed88a3b-6e37-a696-d6bb-38745c144995@oracle.com>
 <fb5b1e66-a2a5-4dd1-8c58-2477b1ca6894@oracle.com>
 <148eabc7-ee00-33fe-b013-0f48fda0163a@oracle.com>
 <aGah5oXmjKCjhI7L@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGah5oXmjKCjhI7L@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CY8PR10MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c91ae4d-c1b5-471e-760e-08ddba47bb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?2+719sEw3bIcG4vwFG8cDQj0YzzC2gKSCkwW0FOFyE9NVskiEAns5b3vlB?=
 =?iso-8859-1?Q?OFq9vaC/EO/lViDRNp23uewlOedtm6OOspDWJV+k+PLXaszcEvuCFYV/l7?=
 =?iso-8859-1?Q?3AP2RB/xDFQETlMJT+qQj03z/vF7Qq952H9bMiP3q7rUzSjV4SbrpVvR+R?=
 =?iso-8859-1?Q?1G1msW1oSfutlBUqhprshY4r2HkHmEhmNMlt1NWKmZTDJ9TVUkycDPQ8k5?=
 =?iso-8859-1?Q?HQBLdkLLwNb7dzh4ZBQWimmVylQo8Tm/ogrEfl1IEZ5D9yPi6nwkqW+B81?=
 =?iso-8859-1?Q?1cqfgVP3n87NfsvInJK78hRr4/ENJ68ZPQ5s+Y1rgJpiN2JM5o6PzSmNwa?=
 =?iso-8859-1?Q?VT9sijic8ZFd6ugyYZYPe8swSlImb+SoLb5au1GYzXUHbITTI4lu9xMtl0?=
 =?iso-8859-1?Q?RW0Y4PAa6c2f7k9hAE8YyjC/ifa5/nJioFfyfMP3uDPPItTAWNiK+lWxJc?=
 =?iso-8859-1?Q?q4HufwMvSrPjVxPPJzkUKIE/PHZ8cpm3v3jz3PFfVI1feIP9ebMO0ipiC6?=
 =?iso-8859-1?Q?vGzRtBq8FHjFoMb8f4qdvSYCwiF1DF1/ZYLO5RZe4cMkHN9rGKH9wPxu5T?=
 =?iso-8859-1?Q?SiubEolGd7FwBM+YrAoXMDXhygygf/120S3X1uxJAv4PcASL9ZO1qRGFYl?=
 =?iso-8859-1?Q?LbyBw/RIw+AMQCe67nmkuMDHSqKuiP+hdEJ8WVGGl+6JF35SvqYc3VBLbi?=
 =?iso-8859-1?Q?fnWNSKAO4uYlyEUTVLGVcSfxzES3KAojSBHRRlRYU0ZHcTofXG9vLdiFXc?=
 =?iso-8859-1?Q?xbzN7VdOxsUOW8+0axuu0llVKfvy83OaqMGH52GLN+S7tM+KP+uR6fQGMh?=
 =?iso-8859-1?Q?8CVPN+vL7UFhJf1sJcBw8/4k1OyUHKnevcKGOSQgOtRRhcvvAukxdDEUT2?=
 =?iso-8859-1?Q?wlRfg8FEGioekgVpbdiW4Wa1smiZ//tckLy3+hvR50m6Cgf/hF8uO1e/KN?=
 =?iso-8859-1?Q?yyR3X87LzX2CiI/dO/GromYYD7lCeza/IzbW0jpBD+LGulGLmZZePzh9+t?=
 =?iso-8859-1?Q?osoEdgiVFyWQ32UlrkAnbxsspkh4d/vC2Vkb3P/8NTKTYA4QCQPjWRlmyZ?=
 =?iso-8859-1?Q?NLlfk2zqtIpFlFXb9H1NstitxW6gu/G6Mkk7k57EXPU86LIJZj9d2VuR+b?=
 =?iso-8859-1?Q?+Q2Dr+WLh0ngzF9gC+N+VvnpeClpHEc28RWvspsiSZuYff1HDl1Z0ZX5PF?=
 =?iso-8859-1?Q?nFZ1/i5horxXjqyrGVZF3796OupyEbP6QLaQCB1VSKwVwRETxAoNZOZNac?=
 =?iso-8859-1?Q?cceHecqrx7dNbhEs0lbD6qKyCahn8FPurjX6gmyOGLudQ1CbOKDR3SShDK?=
 =?iso-8859-1?Q?VsZmDyNfBpCA73Wu/M8jwzY55NiDQrMbOicEz7z1nF5pA9XAFPzYy3wUBS?=
 =?iso-8859-1?Q?InzXkDFaJp7SaxmKnLA8OJDjnEzenIuO33OR1ALY8UGQ1J4n+7rEynJhB2?=
 =?iso-8859-1?Q?R7ePJN3K4rZDxBi4UO0gTVTESST4eRctqS4+VQg5RnRquU1iKm7jlbwcwa?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ji7l/zie4DtNicBNn1COuCcc7wys/KyhdoV6dxX9/8yzEN1WNjgq+PH26k?=
 =?iso-8859-1?Q?6X/tQVC6oAz3FkCNk/zrT4hAiSwymAwDyTKTEjm8usJ+7LPtwSe67Cxaa1?=
 =?iso-8859-1?Q?EQ6Nta6odGRvxxsfPLMY4ufW0GSQxrIF6sPQeg9P0VcLDtvdjoGvbiIc2A?=
 =?iso-8859-1?Q?VckqEMiSzWTHp3cxLJLGvc9+AFfmkwlbXUM0j/tdsXgpF3+RS6ldggod2k?=
 =?iso-8859-1?Q?hEiPfYUCQiOPj8UEUZ/QD0nqVSWm8rHPMjTbrUQYdInfKXrOIMLfBhdec3?=
 =?iso-8859-1?Q?NNGS0DTu5mzuV/cjOHWxOqIcCvAf67cJN+dTHLX5uTtUL2gsTiD0lM7+3n?=
 =?iso-8859-1?Q?bgxNWJkvSaE5L737I0DepTiFAqZlJ279vTcjFZxOZ0vzgxhOAR8gcq3W0z?=
 =?iso-8859-1?Q?wNfgigOTLUCKRH14943l/iWGwnjTpLy6EaeprbUL8udOrGGJ68lRXaLXN8?=
 =?iso-8859-1?Q?fN2omzev/daAdM/qetc6orvyziRlJJOeqvj6d4xX/DAKTRoU9WsOYQ4VXt?=
 =?iso-8859-1?Q?mXXtoRMumR+zMbKfM4ZPb42PaMo+7PfYKCaUvgF7MnuVN3uUJoGasailZM?=
 =?iso-8859-1?Q?gEuouowJXk6B8y9rDVdl0S+KzG0Lyceb/J9AE5cWsVjrB/eul9rck+oeVO?=
 =?iso-8859-1?Q?p4KXnvKQBC/3GnqrwGkEdyXtu1JTjc7hkAN2JVvlHGagkNlebKfuPlV2cC?=
 =?iso-8859-1?Q?ifzHtsjR0dAcrPrzdBNJdwp1Fzd2Asz9TW804ct1VkqL4tM7miCBZmGSRx?=
 =?iso-8859-1?Q?AxTJUPb9PDo1YFmUfNGSdfnmk/+5Gziz8nSf2jgiGrSdF91vAckKSRorAM?=
 =?iso-8859-1?Q?3+9V1b4nR9jBvSgV1E1ax7Z9ilND2EuKkzn8ALWkxzJVlM9QfgKB1QCUtv?=
 =?iso-8859-1?Q?W/k0+TuZQgSucFyg3Gb6jmk8Ymsi+XgxQl1NcpNX/+knti3A5tER8lcPGa?=
 =?iso-8859-1?Q?/Yq0sTk2u8d2n0MMzcKSGjseLIMKu6u4DZ4JxkMjgr7I54nyZDkuLV3K9x?=
 =?iso-8859-1?Q?593eXpnMQ6CtQ6oToOZ4s0C9pMlDW0tuAOnDSMG/8p8VD7PRPzazTBgmpn?=
 =?iso-8859-1?Q?8kZ5/8Z620JW7bYln1UcuVkAjZcUJ35+uWh3CWnkszt+QGtlSaZRYj5z1s?=
 =?iso-8859-1?Q?eQ7pFbrR59bjvZK/dX+0CxB8vBCoTZhoyI8FfzjHbgjk3oWF/i0rlq7m1w?=
 =?iso-8859-1?Q?aJaruUX3H6Nbl8Bhu7SlS4KdENMO12UeBwQbJKXWSoLaeIHBnTjBfjdyjR?=
 =?iso-8859-1?Q?IMtexOXFUHV7TscyuF41siUO1Ff3qv/9RVZSm6oLDmZjDCZGfWZbEHok3h?=
 =?iso-8859-1?Q?O3RQluRuq2Q6sPHrFvz5L2vfiuAay9sNr9oS6AzMZx4cP66KVkAeDTuDgG?=
 =?iso-8859-1?Q?rQOWFsQa39ts/g7E8EOFCqQ1IIXMwniTprt5qKHHn0waLbt/KFcXAs1Mho?=
 =?iso-8859-1?Q?kxEOQX+BRT+bE/8u6M0iuRukh/HY3a5SBXVPfcwmg3lWmyfFbzKrY/tldS?=
 =?iso-8859-1?Q?by36xTVAZHruNqJdkTFMtP4FnJ+uC/dq2PtsvdxUHEqgSDfuae2BltxxlN?=
 =?iso-8859-1?Q?AISNxUdpbShtyqvP7x7KjcFCdOEBhH0rQLSzcYO+UvydURNqEeZ6fWl1hD?=
 =?iso-8859-1?Q?vVxjGALuzN6xLpK0GIDyGy3OGRF64UNH6OQLqjhDqQ0sFzZGKz0wyGLw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qyq+VkGUrMCcIs67EFnr8guTdWAu03MqruIVxl0hg54JZxxqtyjn83c+QE5pSIbLP9sapf+24zxmUTiGQ79mO8U9dVd62LpWEe8IIci0R1ovHmUGph5K0rs47F83k67aRR1yp7hMJYGMlVbe/JhIFfngmmjUp2F9v1i2j9WaHX/NkfcvayQ2KcnOlbzGgJG/NDi6Gp55N9BFnxFdwdL+++F29BKSPm8e3axMdVLqds9lc/rEhqJ0lZlO/+X9d+DUCqE8r/xXyI3tn1/uQ0HB55qt+3+bintBFFLgN957ZBKt70ua29Lr/kEbR9gEMr9M2I/F9H1NQ7KBjUC4seghetHKGcQYImgCSc7ZK2IZ4ZminwhNXvl6vsJLVqtt5UAoyh8cR3XyD2Mm8ZrSp084ANN/ga5TExQS3lWAEsC2gWIhf5Ns/U1eZygjmByR38A5+8uyRuldu3TdZAJVVORgrE2dN8S4eayKQqD4M2XREJ9OFDtd9RpLqiA8i08pP3e/vQ+8QdY9AJdUZO4zuY1KSlPnZY3w0Rrbr+Ul/QBa9hLywLDo38pSUyZqHXzqArOWH1slAFFtTIuV3VGX66XAgvBxmIEkGp4BQApmrqiw4i4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c91ae4d-c1b5-471e-760e-08ddba47bb31
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:39:00.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+gDg1TQonaDvAgi1Q3ypLSIqTU6qV1v3nx7n3jREmvPzmgt84HEjWZkAD2Hk50IS2w+vYCmq38pnDoGTIxPhAeNonnB7hhnZdwnTeCcJsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7268
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030129
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyOSBTYWx0ZWRfXw7hRc1iFPtyN GL2yw5Bm53wRcnYrTi5Kfqdzyh9Obdlwda8H/yyiCTHHtyF0CaFIv/PudT6oSPeIwemEZAhO0ZQ K+sx2J8wvPHNGPoBHn7Enf9/7CPaNjv6R1ZYtRUMmc7jwPwVQaY1m1Mr6V7/fdu/uDj6cXM4Er0
 bZKeq1aWj0YeKuLkAp4ZwETnA79TqwhvySJHDXruwZzs+gGmd38X2hu1HYzkohDefDHM+ucnKBe 8WoQ9viUTl59NFCkNuvvNqMzRvq+RCuYSiIhl5DYTbz8l/YYT0GnK82nCsC8HF3S9I4sHSk4Rap pfakpfFzIS3HW0PgaIHXfJN25Ccf0YytL7U8NwPqFLcIoso3NByagaL5cAuja2bdZcgMukbh7uc
 1FwoQJQLFWK0ia6AK/LWTwTPvoxGkR5Ap0iG+cucyCWBPRWZrOtCHjlTrpl02mf8l9UMuKwq
X-Proofpoint-ORIG-GUID: IT0uAsnLQG4GOyrGcChR_AP8QeQpVMRC
X-Proofpoint-GUID: IT0uAsnLQG4GOyrGcChR_AP8QeQpVMRC
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=6866a419 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=1Vo2Q2ZsDiib6dTzlNkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13565

On Thu, Jul 03, 2025 at 11:29:42AM -0400, Kris Van Hees wrote:
> Not sure if this would confuse things or help, but here is an early attempt I
> did on implementing a tcp provider:
> 
> 	kvh/2.0-branch-dev-tcp

But... it is only on an internal repo since I never finished it :)  But perhaps
it can help with review.  Probably not worth pushing to github because I do not
think what I did is useful anymore in view of Alan's work.

> >From my recollection it was missing stuff, since it was WIP compared to what
> Alan has worked on.
> 
> On Wed, Jul 02, 2025 at 08:02:00PM -0400, Eugene Loh wrote:
> > On 7/2/25 11:06, Alan Maguire wrote:
> > 
> > > On 02/07/2025 00:16, Eugene Loh wrote:
> > > > On most VMs,
> > > >      test/unittest/tcp/tst.ipv4remotetcp.sh
> > > >      test/unittest/tcp/tst.ipv4remotetcpstate.sh
> > > > xfail due to missing remote.  Are we okay with "shrugging our shoulders"
> > > > like that?
> > > Yeah, I don't think the remote test is robust enough. Specifically in
> > > OCI it seems to always fail. I'd suggest we replace it with creating a
> > > network namespace with IP addresses configured on top of veths to
> > > simulate the remote case, the codepaths will be the same. I've done this
> > > in other test suites and it works well.
> > 
> > Sounds great (if "we" is "you", haha).
> > 
> > > > Meanwhile, my one non-OCI VM ran those tests.  The first test passes.
> > > > The second one consistently reports
> > > >      -tcp:::state-change to time-wait - yes
> > > >      +tcp:::state-change to time-wait - no
> > > I hit some of these failure during development; adding the
> > > fbt::tcp_time_wait:entry probe helped. Is that inlined or something
> > > perhaps (grep tcp_time_wait /proc/kallsyms)?
> > 
> > On the VM in question:
> > 
> > # grep -w tcp_time_wait /proc/kallsyms
> > ffffffff92ad25b0 T tcp_time_wait
> > # dtrace -lP fbt |& grep tcp_time_wait
> > 49373        fbt           vmlinux                     tcp_time_wait return
> > 49372        fbt           vmlinux                     tcp_time_wait entry
> > # dtrace -lP rawfbt |& grep tcp_time_wait
> > 51079     rawfbt           vmlinux                     tcp_time_wait return
> > 51078     rawfbt           vmlinux                     tcp_time_wait entry
> > 
> > > > and occasionally reports stuff like
> > > >      dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send):
> > > > invalid address (0x1fc0c0000000000) at BPF pc 287
> > > >      dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send):
> > > > invalid address (0x225b80000000000) at BPF pc 287
> > > > 
> > > ah, ok there must be a null deref somewhere. Haven't seen this before;
> > > what kernel version/arch is this?
> > 
> > 5.15.0-300.161.13.el9uek.x86_64
> > 
> > FWIW, I can comment out all probes in tcp other than:
> > 
> >         { "send", DTRACE_PROBESPEC_NAME,
> > "rawfbt::ip_send_unicast_reply:entry" },
> > 
> > Then I run
> > 
> > dtrace -c "$testdir/client.ip.pl tcp $dest $tcpport" -qn 'tcp:::send
> > /args[2]->ip_saddr == "'$source'"/ { tcpsend++; }'
> > 
> > The disassembly shows that I look up args[2] using dt_bvar_args() (including
> > checking for a fault).  Then we try to dereference args[2]->ip_saddr.  We
> > first check the pointer is non NULL.  Then we call dt_cg_load_scalar() to
> > bpf_probe_read() from the desired location.  This call is problematic.
> > 
> > > > The non-remote tests fail on OL8 UEK6 (x86 and arm).
> > > >      dtrace: failed to compile script /dev/stdin:
> > > >      ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> > > > inet_ntoa arg#1 (ipaddr_t *):
> > > >      Unknown type name
> > > > 
> > > This is a weird failure; I see it on some systems but not on others.
> > > In tcp.d we have
> > > 
> > > #pragma D depends_on library net.d
> > > 
> > > which contains the typedef for ipaddr_t ; it seems that's not enough to
> > > pull in the typedef reliably. I suspect there is a timing element
> > > involved here in when the net.d library is included. Perhaps there is a
> > > better way to define ipaddr_t ; would using a builtin typedef in
> > > _dtrace_typedefs_32/64 work better perhaps?
> > 
> > Don't know.
> > 
> > > > The probe names are
> > > >      tcp:ip:*:*        Solaris
> > > >      tcp:vmlinux:*:*   DTv1
> > > >      tcp:vmlinux::*    with this patch (that is, no more function)
> > > > I guess precedents have already been set for other SDT providers;  so,
> > > > okay.  Just noting for my own sake.
> > > > Meanwhile, the typed args[] have changed in number and type from Solaris> to DTv1 to this patch.  Does that merit discussion?
> > > Hmm, that's not intentional (aside from the additional INBOUND/OUTBOUND
> > > etc which we use to help inform translation).
> > 
> > Worth mentioning somewhere?
> > 
> > > Do you see other changes aside from them? Thanks!
> > 
> > This is what I have for typed args[] for tcp probes.
> > 
> > The typed probe arguments for probes
> >         accept-[refused|established]
> >         connect-[refused|established|request]
> >         receive
> > are the same as for send.
> > 
> > The typed probe arguments for state-change may be different.
> > 
> > So, the typed probe arguments are (wide screen, fixed-width font):
> > 
> > args[0]:      args[1]:      args[2]:      args[3]: args[4]:     
> > args[5]:      args[6]:      args[7]:
> > 
> >             send Solaris         pktinfo_t *   csinfo_t * ipinfo_t *   
> > tcpsinfo_t *  tcpinfo_t *
> >             send DTv1            (unknown)     (unknown) (unknown)    
> > (unknown)     (unknown)     (unknown) int           int
> >             send DTv2            pktinfo_t *   csinfo_t * ipinfo_t *   
> > tcpsinfo_t *  tcpinfo_t *   int tcplsinfo_t * int
> > 
> >             state-change Solaris void          csinfo_t * void         
> > tcpsinfo_t *  void          tcplsinfo_t *
> >             state-change DTv1    (unknown)     (unknown) (unknown)    
> > (unknown)     (unknown)     (unknown) int           int
> >             state-change DTv2    void      *   csinfo_t * void     *   
> > tcpsinfo_t *  void      *   void * tcplsinfo_t * int
> > 
> > Here, "DTv1" refers to legacy DTrace on Linux.  I guess we can ignore that. 
> > By "DTv2" I mean your patch.  For state-change, Solaris calls some things
> > "void" (not "void *") and tcplsinfo_t* moves from args[5] to args[6].
