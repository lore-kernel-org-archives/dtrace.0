Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B302E3703
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850429; cv=fail; b=eGgB7E3/Fnv1Ew9fw0qWH7l/Bsstnrm7V+kSIKCG+ABYtLWVcD7a3lo9t52MHKdHegRXljyImmBw3gnC5AjOHBJ66Ax4kojBhAM1XfKTs6ujnzPi98Rx64DZT8RVpUE/KizrQho7QXHMHwKIYSuZUvogVoYXfkVmMlDbRMTkz1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850429; c=relaxed/simple;
	bh=2+5lGXEWGKAwCIg2DGkc3u+FmYwMH7Ie6jxpQYwZCIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AOII8zI54c/Y+EVkQrdtvXbUeq5E7/C1K3ieTvQxtASSfmAQIRt/j/9mBdmNxVMG4HjR3Z+ZSYGuJlza5/cn9FXF88Nd3wI+j3ygTKQhLBbYLcwKvBPSeuZs759vBy3jTyI3MuljCaDDUeIJzhYSH6XNHRVv1h0GR2te3H4JAQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ed25Z1Zo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j2dwU4Pq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ed25Z1Zo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j2dwU4Pq"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597FB8Br022341
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=x8vmiqQWyFosPChtHH
	3x89LICXZAlkm3gjS4tsCHzeQ=; b=Ed25Z1ZobEpNX06qCBPp0rVAM/+eMACxA7
	OAvUwGmNdPTes2Cb82SCLFvMB8yHGFwLxS+1wvT0HHbz5zoEu25TzgYuc4t5qBIB
	lcBQIYGGZ4c3OmXuwrzBRVJHXK+iFXU4jMLPrB/9Rgznpoy9aFFF/pnakwrxTFPd
	soPoXjvQ2AWH0U5kCQo+gTZ798cCTYRub4ieRvRpGUNe77nBSaOT5k/k9+H7mrDP
	/dNwvhck6xGP7H1Ji+HbRzDbOx7brq5qxKxJIeKbnS0eYdA7JYSEw8bYLDEnarl3
	t+tajTaVLFSsWGDZ5E913DrrFJmt+rtv92+K9sWHrquGvAoW9Bzw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49n599r106-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:20:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597EivnW005682
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:20:25 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18k6xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:20:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIgnFLF88DM0K9pOifwT3wlQUggVtVSHsvmPdj2W83IkkhtQ0C5WqzcH5lnjJDly0BInod+08S4/q6QBoVAdMan3Mb5LGwVGlAKDKYA0sPC4InflVz0eiUvqEv9RUPC2Ux8L/TF50Q9aFAwDkZc/wy7qT77G5pqZAefSBx0CnnDyNOBm0n+9IMYFpZA0U+H77Ct4S1NFRn+L0gDlMjbioIJWtT0viB3YTnYOz9qVOXMIrK50D8tGnBeLbG4/wJoO7ThC8LehWccxyYac+KUTA6HJU9m+PuGZuxbDh7o4hE5YomvgeJfEMimoqIKRuvUi3Er3h7qXOEO2mIGVlN57jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8vmiqQWyFosPChtHH3x89LICXZAlkm3gjS4tsCHzeQ=;
 b=W0O8ZmGQSbzsXscDWDl5VbtE5tr6MyreWTAlAZ+hDh6VhWJio5eMX3rnmB5Xtx2hM3njiin083gyDlJzB64Fek4niVdk0ci2An1UxQ44Uqxeqaey57+3NkMBdeKsnNRurXZ97sEj3BQMYZtPEh87tCr/BkWbM1icYM7JWxJmRNJgFPJbSTXHaxiKDKhhGB2ToAkB+RlE/5yDoknERkAPM0ieYjOxL1pGIWGUHnLR0rg+JBGbrRXdVI0XcCmRYvlfuLPPHW/DIjU17E2Cyd//Hy6kmUCnViogC2K037Aaes4Cr9rnnPVwe1CbPR3U6+1vHcupGyc4yY4doF1DVyg94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8vmiqQWyFosPChtHH3x89LICXZAlkm3gjS4tsCHzeQ=;
 b=j2dwU4PqIChdfNHF58Ux+Hc2cBhcNfVuAozDNupRwOU47eNDcZq9Z2rXRYm3gLCToTPJ8LxsAmwAbKpvyT0i2dRr5dEmanmtU/E2SHrti6/bnTuGt9743XY9q4nb1yDgjpxuprB/DBvXFhuUCYn+SGKvsY2o1zHnZry2oskxkwA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BLAPR10MB4961.namprd10.prod.outlook.com (2603:10b6:208:332::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:20:16 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 15:20:16 +0000
Date: Tue, 7 Oct 2025 11:20:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] Allow probes not to attach if they were not "needed"
Message-ID: <aOUvrBynVHl73JRb@oracle.com>
References: <20250918060213.26896-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918060213.26896-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BLAPR10MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 545cdf58-b6f8-4a28-4e19-08de05b50474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jnHJJ7UGtWqXWynro3J6kEfKav9YTuFEARTl413ItsYNMUeDNgu5uYxnWfo4?=
 =?us-ascii?Q?LlwP9O+NnxecMjgLjOSu5YeGjPAjTO+ZGeop2kGK4KCc8xhKb0vWct+5ErWT?=
 =?us-ascii?Q?6utxoeYOfcCx4jGQSFIDELWpLIIJSEpGR5M4hJuBAZKsb19XPxpa+FaZh50/?=
 =?us-ascii?Q?+1eJ8dUP52MbmFGemxioL8PV0W4bJE/Ifjq2hhWMZmA+z4sMjDpWpP7aDS+h?=
 =?us-ascii?Q?wcu68q6644NdB+8JR8pb+BY0xVv+MsAY5MLtt4rL0lgyiUCL5dVurIrty+II?=
 =?us-ascii?Q?BOiIWngMzDvKfwTmsLQ3xt21ZY4rgRg4YKzQQtR7j6iQSf8CSHK9rpEVU2Di?=
 =?us-ascii?Q?jFD5Jam8KPjNNL88kXxaK1pAekXTmU/xRSsRw7eJFOGgclNub44TKNleN99r?=
 =?us-ascii?Q?Ds8gHNe3Txl20O/Vu0trt5GnLOCa1iZxxj5N5d0Fcbcpn0iYk0v2+rRFFfdh?=
 =?us-ascii?Q?AborfTfIvl2NHfwIsMahAVSKTU/Rg1eDa8ndAHpwVGoUG+HZYwaaTZ/Y70Nq?=
 =?us-ascii?Q?cSUHj7Uu7TJNsojWVEjqnyErGHxJ1Fajen0Xgv6Pkls++1WAbsMs1Ul2Nwq8?=
 =?us-ascii?Q?ACsd50P2sCiY8h8MwgEwt7VXViPqhITgECmRBl7kRijvPEbOzRN1ubKj8WP3?=
 =?us-ascii?Q?jiSWvfPo4X9WhgO9lI5k8dzSWw6ulTTtkrcg+q8FX0MQonr3OzJA4Vk5TMmm?=
 =?us-ascii?Q?6/K1pREwtriuWHrRRQ2OypOIcyOCwuQPCzcj9rkRBYVt/gBkMgMHgfKwNVhU?=
 =?us-ascii?Q?l0DGFWztDunTjh0Emy+rcDd0wY7BBctRoOkOThM19z7LPen0kQUh5MTgMIip?=
 =?us-ascii?Q?pG6dTmt9Jh0PO3Jb9Nv97/tSzfkPcWETTFdah1knLoi4wvQYX5EVTZVE0Num?=
 =?us-ascii?Q?oIZO26EoKEfaZ0Zr92fOVS3pW9odfc/aCS0kcPW663WeNlY+QmSBbqb2laAW?=
 =?us-ascii?Q?7QY9DqA8A6BQZwrxwJq8CHi0Ytl/BgojtQUaDP+nHEABgSY8qw+GvgkyDvlh?=
 =?us-ascii?Q?7f1Z9HdKOIH4dMQdJp32nF5jETs2X65+Z+DGHsTSg8fKFk25by1aE8d/lvqn?=
 =?us-ascii?Q?yqV2JE8D5ZecHFR+jAZx6gXNr3yRdAjbm3gFia4R9LSDDoeEftOw5WgIFEo1?=
 =?us-ascii?Q?UBkoEF956CwUDgAGCx7+n0t1tM/H2mYwnBbiWg98NMib/5ci1khAV4KfQdRN?=
 =?us-ascii?Q?uZiSHK5QXvf0ayYTn30VM7xDSyTSZ3FBOr4ZvKiAE2yO7Yz1w04SeBt3Dv90?=
 =?us-ascii?Q?RalnXtgscxne7lYKTxt3TldcT12xdyxrHHU2dSnik21YJfBMFmWoQx02WZlH?=
 =?us-ascii?Q?juFgHczFOb7nlKLkW9JISb71Psv5rtjwEMmTQe6As1prDropgUwy03Nfpg1i?=
 =?us-ascii?Q?cmZJVptu2wG31Drb/SEQQXFD71gJo9mPG+bYBEBrZhbinlyb3F5ATY876IyL?=
 =?us-ascii?Q?2NPL38vuNX5frnO6BW28PeIUmjomTkvHwyiHZ3qcitt/+x3gtgxC7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n43sptca+CVLpqCHc6zJEWJdExaoRj0fHFlR9shtxg6i/YsKk4DFahqtKrzO?=
 =?us-ascii?Q?WIM5QQJQDM2DdgwmWpyVr2CjGk9ytf5H0LU3NvdSAE48MF3wroK4vj4ojjyW?=
 =?us-ascii?Q?JQs7Ixzj1Q6rAZ/RxPGU2ZAbJNCwe3DUwGh3wldgTDB9aN6R+MqwphS8gPdA?=
 =?us-ascii?Q?zEZhFvXZU3xy5v3MwjBLzdPNVYe/Pmr+uUjWAGCJHIT5fhMl2mfrNOLIEbqj?=
 =?us-ascii?Q?KIUQQNx0vrrbyX8KnfXbnYREgua0Ncgdx6HDdM1JDyu5/umFx6HvO29iCzGy?=
 =?us-ascii?Q?N59q8ZIqOk8tCtnNohsrQPsVEjj162XnAyAoqEB09xTTvtUcQKuZqItSGlHK?=
 =?us-ascii?Q?xi4ewxf749ZnsFrC+PF2PDaeVMfPFeH6X6GyLSgZJceerB/Z58kAfH0Nk4P8?=
 =?us-ascii?Q?c5+P9hVYRuWA1GdTCR+z08tcJfNsyy1ekSyQd7rV6PfZZ0g2PcX/HbKBWJt9?=
 =?us-ascii?Q?RXWa3ZstIi6GeS4GB5v0Mw4Pn+P1Q4RLuHvpw/C6Akeorz88ZTO8hq5Rnldf?=
 =?us-ascii?Q?E78Rogb2BNfZNYJ+JDzU7ZIyVACRKMdmAgNsn2ChQcTAnvkdER0rJGSx9dDX?=
 =?us-ascii?Q?uvW4Us2Wq7KONpKju53A1nC6lg+/fEeZu2ocgkwiBBjJmCe8kw/A+aVU2yZO?=
 =?us-ascii?Q?OHMf3Q3dxfR87CZ30TgJtn96HCngCgDPVuxmbn1xDqUatGHgsslbyqKDfrxm?=
 =?us-ascii?Q?8lMxfljGxXQFDsbSDnTNNVkICJcLDqstL3DQh52HXy+33BJ5EtdfjPLqv+p7?=
 =?us-ascii?Q?+Zswlsins7/RA0JlzOFP6RyeUYHh2sQeNPBWDPLOK8EYRGaMhMT+jk1eo/k/?=
 =?us-ascii?Q?AvFNz78xjfVv0eAPAs7tQ+VKTeplbZXS9yUggJGA3CMM7XdgUjy+UdNoJgzZ?=
 =?us-ascii?Q?fVATQx/1HlSuubXJr6ZEag6DCqMYGgSrh/uSmclv19hoy3u6hWH2iHFGQi2F?=
 =?us-ascii?Q?KIhr2Fy/IwWDcXk4D7njfAwTFRfWk4NeghNYMhjqdnK+Oo5Vy5b4QsLRwgTI?=
 =?us-ascii?Q?aODiCcUZ39yxDgMcHFG/exLWtl+zgQbfyQDHROH4H/0GrDQiw72Tujar5+PU?=
 =?us-ascii?Q?oqb3j6Eib35y3WIiPejfWAgdPNFmQkbKiPzGS76lX6tgm+pq7TfGaDaq31uT?=
 =?us-ascii?Q?LBCRnCNAxYjp2icw8wMU4347UjnaTPhiWYbbynLSp9A6T7c+TevRPrejd8mw?=
 =?us-ascii?Q?Zc3VPfx8uL1fNGcP4ypBOr7cKaMQcMnwYlOGFuzv/AKPO9BYYGbDpC7ycRAM?=
 =?us-ascii?Q?bo3lzX4LCN5srWYeeE9bJ/xS52Hm5WqjFV3J/B1PBQCQqPjNmvWFEHpi5bMC?=
 =?us-ascii?Q?URAPWGYwuvvXwwesu2nAhZ84LtZMA2OANRlve5QG0QaTANMamkrkKUFCumXb?=
 =?us-ascii?Q?wPToCNJH/ptgz0bpDvvnhHd0S141m+SvNlKJr5xskj95xp5xAaf/xkANv/Mc?=
 =?us-ascii?Q?1KCz2KoWqdy2fXAZ4Kza3mmFca2O/xLzUNRhG9dFdX5mhJQqchM3iAcyln/X?=
 =?us-ascii?Q?Jf3x+d5qFZAM7n9N2N/j9ZY4E65qnFSbpiaGEf/fj6kIiUQeWFq8K4Pd5aAz?=
 =?us-ascii?Q?miIWTpvenMj+2u5VtfKqnq4YKwZo9spGHves34tvikPEwtZKvDTY53PIPvLY?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4UqJRk+pf0PpaOXZDAWX9/QmGZSnVpl0Ac/3OFDjaHActyzf7WzwgALrQGUMHyQtaSTuu0NN/ccROQMrl0ZJTbrg1EitSIlFskrCwJpb6/Fh8L+3Nqqt8+YzpJi8Gl7bryD6jtPc3OO8RDdn87Yss1AwARoURIKqIPplUAb/q0rQeAUx845YoIs90Z1LdcnWTK0x+bz0GJbVyhN0tXUnlip9frPKz4iDohsn03xJN3Ie17tRr6rZYsVYRJIRxhjyfUfFXpF2Gj6q+aHsZm5f5QErzd4m0txxLm49yClPxKUScBdD5fP9sNaOMdVpFhR5KbFmTKuJp4Xe3bmNCDLHPHKYbKrw1yH2bxwJZrbim1hSv2sAWFngGRlwQBofGWSPGfvJpZKb5XeikbiXqMCzyfvf0s4BdoUXXI0IEDyjePfWZ0iEZ1Tex4PK9WrP3Nde0gLsI1QtNpWSmNgLdtlDq4p9LKyeHD51oM8/pvEoyAro/bOo2SXBphM6FE0l3l0x7KF1Q9+eb0H3Ho3d6QJGOdAp+ejT9b9SojwNAqFuvb8SWd7WRuoO/XCsjqFnKlFa6fBtxxXRaaxhLXkRULih2/NEYKoFDH4FCO+GeoAQpa0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545cdf58-b6f8-4a28-4e19-08de05b50474
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:20:15.9718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcmCjTTUy865tpVgN0M7QlAUChrDRksoeSjw2rCon0WMEx1ST23cF0euv2A+I5vKvn4vSTLmL/0WbtsWUsr+z/j2Wntxz1i+WkSRmHpR204=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4961
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070121
X-Proofpoint-ORIG-GUID: Snd59kp_3odEKAP_veF4rS3TrCsZGTAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDEyMCBTYWx0ZWRfX5pqtJwVyHDW2
 MexwaPOLGAL5LP+JnCkAEjYueMwiYOQy6soGKy053ALLbE31ZKI/n5vtTm/Z4a8EptH+eDGu5Ay
 7NVU3BbOMLX5Hjmik7usenoSsSWOMoXO0JwEhtA+pr1dWbof3cIbpZbUwxWC4dSmetBUJ5eWO9J
 gSYrbu7BUtbYeJGExoJeJQRmqhTdvWVQNumuVb2zaG0NAeaR6gpBrKKYX4RwoSkyg62Lnr++bOZ
 6ewdvcayeuF1MAnslyajCUXercr17woliap/aawWDAqVvbzbS+oM+omOQfQoTYOkB4Yh38X15AN
 wYd+v7abDBlH06hzmnx4xbAOB9RKikBJUDje1V7DDX21Wg5ckbjNnIT1LqJxCjPl6fYS9X5ezoB
 bZHaLFyX65xW7w+XbAPRtjl/apX4qw==
X-Proofpoint-GUID: Snd59kp_3odEKAP_veF4rS3TrCsZGTAb
X-Authority-Analysis: v=2.4 cv=MdFhep/f c=1 sm=1 tr=0 ts=68e52fba cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=mJyVdKuwy1mpQMmB:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=YPjH9xTz_fZf_5r6R40A:9 a=CjuIK1q_8ugA:10

On Thu, Sep 18, 2025 at 02:02:13AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Various kernels prevent the placement of uprobes on particular
> instructions -- e.g., on x86 on hlt or multi-byte nops, or on aarch64 on
> autiasp.  This means, for example, that one cannot place a pid probe on
> every possible instruction.  If a user explicitly places a probe on a
> forbidden instruction, an error message indicates there is a problem.
> 
> On the other hand, if the user specifies a wildcard in a pid probe
> name, we should skip instructions where no uprobe can be placed.
> 
> The problem is that we do not find out an instruction is problematic
> until we try to attach, which is long after probe descriptions have been
> processed.  And when we walk probe descriptions, we do not have
> information about which kernels and instructions are problematic.
> 
> The motivating problem pertains to pid probes, but we would like
> a provider-agnostic solution.
> 
> Set an "OPTIONAL" probe flag when a probe is not needed:
> 
> * In dt_probe.h, DT_PROBE_FLAG_OPTIONAL is used for the "flags"
>   member of dt_probe_t.
> 
> * For pid-style probes (including USDT and stapsdt), in
>   include/dtrace/pid.h, DT_PID_PSP_FLAG_OPTIONAL is used for
>   the pps_flags member of pid_probespec_t.
> 
> Remove the old check on "hlt" instructions, since it was not sufficiently
> general for other kernels and other problematic instructions.
> 
> Existing tests that expose the problem are
> 
>     test/unittest/pid/tst.coverage.d
>     test/unittest/pid/tst.emptystack.d
>     test/unittest/pid/tst.entry_off0.sh
>         hlt instruction on x86
> 
>     test/unittest/pid/tst.float.d
>         multi-byte nop on x86 on newer platforms
> 
>     test/unittest/pid/tst.entry_off0.sh
>         autiasp instruction on aarch64 on newer platforms
>         depending on how the trigger process was built
> 
> New tests are added to check that a probe set explicitly on a
> problematic instruction will still lead to an error, even if a
> probe description before or after it tolerates attach failure.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  include/dtrace/pid.h                          |  3 +++
>  libdtrace/dt_bpf.c                            |  2 +-
>  libdtrace/dt_pid.c                            |  7 +----
>  libdtrace/dt_probe.h                          |  3 +++
>  libdtrace/dt_prov_uprobe.c                    | 26 ++++++++++++++++---
>  .../pid/err.opt_after_needed.aarch64.x        |  3 +++
>  test/unittest/pid/err.opt_after_needed.sh     | 25 ++++++++++++++++++
>  .../pid/err.opt_after_needed.x86_64.x         |  6 +++++
>  .../pid/err.opt_before_needed.aarch64.x       |  3 +++
>  test/unittest/pid/err.opt_before_needed.sh    | 25 ++++++++++++++++++
>  .../pid/err.opt_before_needed.x86_64.x        |  6 +++++
>  test/unittest/pid/err.optional.aarch64.x      |  3 +++
>  test/unittest/pid/err.optional.sh             | 25 ++++++++++++++++++
>  test/unittest/pid/err.optional.x86_64.x       |  6 +++++
>  test/unittest/pid/tst.entry_off0.sh           |  4 +--
>  15 files changed, 135 insertions(+), 12 deletions(-)
>  create mode 100755 test/unittest/pid/err.opt_after_needed.aarch64.x
>  create mode 100755 test/unittest/pid/err.opt_after_needed.sh
>  create mode 100755 test/unittest/pid/err.opt_after_needed.x86_64.x
>  create mode 100755 test/unittest/pid/err.opt_before_needed.aarch64.x
>  create mode 100755 test/unittest/pid/err.opt_before_needed.sh
>  create mode 100755 test/unittest/pid/err.opt_before_needed.x86_64.x
>  create mode 100755 test/unittest/pid/err.optional.aarch64.x
>  create mode 100755 test/unittest/pid/err.optional.sh
>  create mode 100755 test/unittest/pid/err.optional.x86_64.x
> 
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 8ddb1167e..4a239b076 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -47,6 +47,7 @@ typedef struct pid_probespec {
>  	size_t pps_xargvlen;			/* (high estimate of) length of array */
>  	int8_t *pps_argmap;			/* mapped arg indexes */
>  	char *pps_sargv;			/* list of arg sources */
> +	int pps_flags;				/* flags */
>  
>  	/*
>  	 * Fields below this point do not apply to underlying probes.
> @@ -55,4 +56,6 @@ typedef struct pid_probespec {
>  	uint64_t pps_nameoff;			/* offset to use for name */
>  } pid_probespec_t;
>  
> +#define DT_PID_PSP_FLAG_OPTIONAL	1	/* probe is optional */
> +
>  #endif /* _DTRACE_PID_H */
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 31781ac9f..0223764a6 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1385,7 +1385,7 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>  		if (prp->prov->impl->attach)
>  			rc = prp->prov->impl->attach(dtp, prp, fd);
>  
> -		if (rc < 0) {
> +		if (rc < 0 && !(prp->flags & DT_PROBE_FLAG_OPTIONAL)) {
>  			close(fd);
>  			dt_attach_error(dtp, rc,
>  					prp->desc->prv, prp->desc->mod,
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index ffc52132f..7d6cfb4dc 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -386,15 +386,10 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  #define disasm(x, y) 4
>  #endif
>  
> +		psp->pps_flags |= DT_PID_PSP_FLAG_OPTIONAL;
>  		for (off = 0; off < symp->st_size; off += disasm(off, &disasm_info)) {
>  			char offstr[32];
>  
> -#if defined(__amd64)
> -			/* Newer kernels do not allow uprobes on "hlt" instructions. */
> -			if ((unsigned int)disasm_info.buffer[off] == 0xf4)
> -				continue;
> -#endif
> -
>  			snprintf(offstr, sizeof(offstr), "%lx", off);
>  			if (!gmatch(offstr, pp->dpp_name))
>  				continue;
> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
> index 2a78cb9ca..637875183 100644
> --- a/libdtrace/dt_probe.h
> +++ b/libdtrace/dt_probe.h
> @@ -53,10 +53,13 @@ typedef struct dt_probe {
>  	uint8_t *mapping;		/* translated argument mapping */
>  	dtrace_typeinfo_t *argv;	/* output argument types */
>  	int argc;			/* output argument count */
> +	int flags;			/* flags for the probe */
>  	dt_probe_instance_t *pr_inst;	/* list of functions and offsets */
>  	dtrace_difo_t *difo;		/* BPF probe program */
>  } dt_probe_t;
>  
> +#define DT_PROBE_FLAG_OPTIONAL	1	/* probe is optional */
> +
>  extern dt_probe_t *dt_probe_lookup2(dt_provider_t *, const char *);
>  extern dt_probe_t *dt_probe_create(dtrace_hdl_t *, dt_ident_t *, int,
>      dt_node_t *, uint_t, dt_node_t *, uint_t);
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 07b26f20f..3b7145a50 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -957,9 +957,16 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  				       upp);
>  		if (uprp == NULL)
>  			goto fail;
> -	} else
> +
> +		if (psp->pps_flags & DT_PID_PSP_FLAG_OPTIONAL)
> +			uprp->flags |= DT_PROBE_FLAG_OPTIONAL;
> +	} else {
>  		upp = uprp->prv_data;
>  
> +		if (!(psp->pps_flags & DT_PID_PSP_FLAG_OPTIONAL))
> +			uprp->flags &= ~DT_PROBE_FLAG_OPTIONAL;
> +	}
> +
>  	/*
>  	 * Only one USDT probe can correspond to each underlying probe.
>  	 */
> @@ -1049,6 +1056,12 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	/* Look up the overlying probe. */
>  	prp = dt_probe_lookup(dtp, &pd);
>  	if (prp != NULL) {
> +		/*
> +		 * If not optional, pass that info on.
> +		 */
> +		if (!(psp->pps_flags & DT_PID_PSP_FLAG_OPTIONAL))
> +			prp->flags &= ~DT_PROBE_FLAG_OPTIONAL;
> +
>  		/*
>  		 * Probe already exists.  If it's already in the underlying
>  		 * probe's probe list, there is nothing left to do.
> @@ -1079,10 +1092,17 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	 */
>  
>  	pup->probe = uprp;
> -	if (prp == NULL)
> +	if (prp == NULL) {
>  		prp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
>  				      pup);
> -	else
> +
> +		/*
> +		 * If not optional, pass that info on.
> +		 */
> +		if (psp->pps_flags & DT_PID_PSP_FLAG_OPTIONAL)
> +			prp->flags |= DT_PROBE_FLAG_OPTIONAL;
> +
> +	} else
>  		dt_list_append((dt_list_t *)prp->prv_data, pup);
>  
>  	if (prp == NULL) {
> diff --git a/test/unittest/pid/err.opt_after_needed.aarch64.x b/test/unittest/pid/err.opt_after_needed.aarch64.x
> new file mode 100755
> index 000000000..bd5b41a36
> --- /dev/null
> +++ b/test/unittest/pid/err.opt_after_needed.aarch64.x
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +echo "skip on aarch64"
> +exit 2
> diff --git a/test/unittest/pid/err.opt_after_needed.sh b/test/unittest/pid/err.opt_after_needed.sh
> new file mode 100755
> index 000000000..3ee65cd93
> --- /dev/null
> +++ b/test/unittest/pid/err.opt_after_needed.sh
> @@ -0,0 +1,25 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +# We should not be able to trace on a hlt instruction, which is forbidden
> +# by the kernel.
> +#
> +# (Test tst.entry_off0.sh should be okay, since there the probe on that
> +# instruction is optional, and dtrace will silently skip over such
> +# problematic instructions.  Here, however, the probe on the instruction
> +# is explicitly requested by the user.)
> +
> +dtrace=$1
> +trig=`pwd`/test/triggers/ustack-tst-basic
> +off=`${OBJDUMP} -d $trig | awk '/hlt/ {sub(/:/, ""); print $1}'`
> +
> +$dtrace $dt_flags -c $trig -n 'pid$target:a.out:-:'$off',pid$target:a.out::
> +{
> +	trace("hlt instruction");
> +	exit(0);
> +}'
> diff --git a/test/unittest/pid/err.opt_after_needed.x86_64.x b/test/unittest/pid/err.opt_after_needed.x86_64.x
> new file mode 100755
> index 000000000..158336d98
> --- /dev/null
> +++ b/test/unittest/pid/err.opt_after_needed.x86_64.x
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +if ! ${OBJDUMP} -d test/triggers/ustack-tst-basic | grep hlt; then
> +    echo "did not find hlt instruction in trigger"
> +    exit 2
> +fi
> +exit 0
> diff --git a/test/unittest/pid/err.opt_before_needed.aarch64.x b/test/unittest/pid/err.opt_before_needed.aarch64.x
> new file mode 100755
> index 000000000..bd5b41a36
> --- /dev/null
> +++ b/test/unittest/pid/err.opt_before_needed.aarch64.x
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +echo "skip on aarch64"
> +exit 2
> diff --git a/test/unittest/pid/err.opt_before_needed.sh b/test/unittest/pid/err.opt_before_needed.sh
> new file mode 100755
> index 000000000..f1f172a18
> --- /dev/null
> +++ b/test/unittest/pid/err.opt_before_needed.sh
> @@ -0,0 +1,25 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +# We should not be able to trace on a hlt instruction, which is forbidden
> +# by the kernel.
> +#
> +# (Test tst.entry_off0.sh should be okay, since there the probe on that
> +# instruction is optional, and dtrace will silently skip over such
> +# problematic instructions.  Here, however, the probe on the instruction
> +# is explicitly requested by the user.)
> +
> +dtrace=$1
> +trig=`pwd`/test/triggers/ustack-tst-basic
> +off=`${OBJDUMP} -d $trig | awk '/hlt/ {sub(/:/, ""); print $1}'`
> +
> +$dtrace $dt_flags -c $trig -n 'pid$target:a.out::,pid$target:a.out:-:'$off'
> +{
> +	trace("hlt instruction");
> +	exit(0);
> +}'
> diff --git a/test/unittest/pid/err.opt_before_needed.x86_64.x b/test/unittest/pid/err.opt_before_needed.x86_64.x
> new file mode 100755
> index 000000000..158336d98
> --- /dev/null
> +++ b/test/unittest/pid/err.opt_before_needed.x86_64.x
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +if ! ${OBJDUMP} -d test/triggers/ustack-tst-basic | grep hlt; then
> +    echo "did not find hlt instruction in trigger"
> +    exit 2
> +fi
> +exit 0
> diff --git a/test/unittest/pid/err.optional.aarch64.x b/test/unittest/pid/err.optional.aarch64.x
> new file mode 100755
> index 000000000..bd5b41a36
> --- /dev/null
> +++ b/test/unittest/pid/err.optional.aarch64.x
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +echo "skip on aarch64"
> +exit 2
> diff --git a/test/unittest/pid/err.optional.sh b/test/unittest/pid/err.optional.sh
> new file mode 100755
> index 000000000..1dbef4e45
> --- /dev/null
> +++ b/test/unittest/pid/err.optional.sh
> @@ -0,0 +1,25 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +# We should not be able to trace on a hlt instruction, which is forbidden
> +# by the kernel.
> +#
> +# (Test tst.entry_off0.sh should be okay, since there the probe on that
> +# instruction is optional, and dtrace will silently skip over such
> +# problematic instructions.  Here, however, the probe on the instruction
> +# is explicitly requested by the user.)
> +
> +dtrace=$1
> +trig=`pwd`/test/triggers/ustack-tst-basic
> +off=`${OBJDUMP} -d $trig | awk '/hlt/ {sub(/:/, ""); print $1}'`
> +
> +$dtrace $dt_flags -c $trig -n 'pid$target:a.out:-:'$off'
> +{
> +	trace("hlt instruction");
> +	exit(0);
> +}'
> diff --git a/test/unittest/pid/err.optional.x86_64.x b/test/unittest/pid/err.optional.x86_64.x
> new file mode 100755
> index 000000000..158336d98
> --- /dev/null
> +++ b/test/unittest/pid/err.optional.x86_64.x
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +if ! ${OBJDUMP} -d test/triggers/ustack-tst-basic | grep hlt; then
> +    echo "did not find hlt instruction in trigger"
> +    exit 2
> +fi
> +exit 0
> diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
> index 1a4c3d207..304be4568 100755
> --- a/test/unittest/pid/tst.entry_off0.sh
> +++ b/test/unittest/pid/tst.entry_off0.sh
> @@ -1,14 +1,14 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
>  
>  # Although the D script takes only "one second," it takes a long time to
>  # shut down.  Until that has been solved, increase the timeout for the test.
> -# @@timeout: 120
> +# @@timeout: 240
>  
>  dtrace=$1
>  
> -- 
> 2.47.3
> 
