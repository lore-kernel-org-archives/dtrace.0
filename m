Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE8628B50F
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 17:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745515679; cv=fail; b=a0eRevsswPzxZKC3vExwUPcQ6rjcRSDdXOqx3bku4huAX4Ixhcsgby0kF8rH8iOoO02+FTWyT2OCTLDaVzJadxjlmYVYw0ZlMj+AE7HvZ84ckj2yAEqNnQ/eRd6d8v4cX3YPKRcKvLoIK6QBgDwdYIa7vmbXkHxP3pbEr5JmVG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745515679; c=relaxed/simple;
	bh=e936RTscGp6cjv8QZwex2dXLccsaHkUAU1Y/ro3hNIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZtdFSBCxirSWNwL/ppOF9qhtADtErptWfkX0PbBCpoLT2s5bPh9612YwQSuZEQe9ZOrLGemx4kAP/B8A+L98kZ2e8x5puggahhlEuwjomxdANAFsfUB/b1AfIIEM8tnjW51xzdpQhJPi4Qyz1//N9aqsws3sIRMAi0SzOVKDHBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k792w08u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jXqwZTkL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k792w08u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jXqwZTkL"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OGla8g029635
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 17:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Kjk5nyHU7T5OHj8OTA
	w9Ye5gltJ0pYoiH19g8MZIllQ=; b=k792w08uSchlzRWINJPfiml/9Sa5g+DLrN
	VavuZrqqN72TjY53b7dCzH1bVQ68n13CD4M71Cfpq6N1fk2Q2CZ1CFmtXWqnXP+C
	VIz/lWiWrRXvsBNSl2JjPyLngkU8pK9QFNUpux9EdFTMsxkqQozh4bHi+fo0XUCs
	zSa/URRBhAJah8kzAEo8coWhu3b46pczDf60D+iVgDuzvFjL9hlHF8fCtvgs1DB2
	RAY6ggr3VAbyP4eujbyCa2oTuMdmM8qrfq0InxIY1wz2f7zHp95YRhBbdpZnwAFV
	yjEx/dVJLmzXt1XfdXrwIVGvIaoL1HC1RdUWVgzoCCCx0Vz0tXzg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467s4a84tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 17:27:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53OGmtMV032512
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 17:27:54 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010004.outbound.protection.outlook.com [40.93.6.4])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 467gfrq0et-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 17:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlwGs5h8srF+3Lr8CKsQ9ixZ8/BqMFe42qarvW6ihP3otdWY/9E8LA4HzhGIGPfuqwxaJP6AeyqTUkesVtrwt97j6VtZWwHlkfnqY4iqLZfNt8vW1c5v28fULdLwebWsOqY+reQR2DdoAYH5sAivToiMiyGN0C8gDv4VOfjsNSgbK+5EWCqmpWKZ9a73817Xc6HZsDU05kR4CxRDAyTkg+7uSVyUXe6wKTHkBuPJxnWeLR4xHiDssK77e5DPP5Na3ZsxT97lfSTiXjnylJseeeiCxL3WBKc9n1oC0JRv9tP1MgszppZQJ0USofKS3TaHfiiOzjx/UcQG9ifNYzSHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kjk5nyHU7T5OHj8OTAw9Ye5gltJ0pYoiH19g8MZIllQ=;
 b=QdTSUobug3KnzYWmJajq+nH2/gIzCy0fGASIgbY7FEOXOEFplJxYODkHlIUZYyzCCDL3bb0dm9Pc5FpHuADzng/e3mVpF1T62KfBJXK6UqlJA+fBGM7nqiCBVeZUK/ucpfNis8aLH3+qs1j35onpfwmepnUxisFJ5OBaIvG5gUgJo+tOgtgG0UT/uxhigNPxJy3W4qFOJH3K9oieXP0exosh7UBANs/7mcgPBUQ4Qk81tw7hUvgbKCPLL3BN6DqwBRETCGb/VunuHAscgDs7QyvjjIz7WKkbSVAGETtTFDTORvVpBK6vnNkFy3LMuXBTxOJyLeAsyv3DpYGcIuYZaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kjk5nyHU7T5OHj8OTAw9Ye5gltJ0pYoiH19g8MZIllQ=;
 b=jXqwZTkL/zkAMh6l8LnVC8WYiNjSsJ1+ux05gMm51TYWaBt83G96kNEnIa+QZBc3efQzAWejXxkhMeppx5/eUxGGAPsKyIOWkob+zHifzZnWLlsZN0d7DUNbbkK2/aL2NER5Lz7p7bbilte3sSo4l6H5B2hw3u6lvgxxZjs7tDg=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by PH7PR10MB6555.namprd10.prod.outlook.com
 (2603:10b6:510:206::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 17:27:51 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 17:27:51 +0000
Date: Thu, 24 Apr 2025 13:27:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3] Allow arbitrary tracefs mount points
Message-ID: <aAp0lOy5VX0LWP+5@oracle.com>
References: <20241112134256.118717-1-nick.alcock@oracle.com>
 <ZzeySbY7k8Wt5iU7@kvh-deb-bpf.us.oracle.com>
 <Z74xR3dDklGv2efx@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z74xR3dDklGv2efx@kvh-deb-bpf.us.oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|PH7PR10MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: 1220ba35-0ac0-4e87-d743-08dd835556a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rc/aZT3GfMVFfp51FgM4iPQT62u/6zMtOIyacLOo3apwsqtp8y7/7aEyqMS/?=
 =?us-ascii?Q?EzCxW6pL2qPpEm/SGoV7BvaM+XlqPLg2EObE/A1PumCzJkzQpUwpgtv26Akb?=
 =?us-ascii?Q?knR5qN2hxt91ZIud6OTRuycYx5Q+aBwilXjXJNYlzPyX6xrYCY0oa5mKjHzY?=
 =?us-ascii?Q?i8+60VvfcET0/OKeh+yXuk+OgqhciYrbygUH0ZRmmtArXmurELh9MGvvkA+g?=
 =?us-ascii?Q?nbHg5miD2QtXUcNzPUHiPGXVnzxKUqlYSvXnJ7bdcw02/8OMq3qQvr5QkWM2?=
 =?us-ascii?Q?ZlM9w00EM1t93EU9s7j2PIeQJUskuTh6mstRl/DkAD+R3/uEV1Ae87sF9N05?=
 =?us-ascii?Q?rnxO3HWX13k7wClCLeEcoYGoWW+MzdBpWPxMl27Ndh5FfPDH5PMpV97btgUx?=
 =?us-ascii?Q?hFHgYDAbvzng6eLwo35zeQjJdPJDLaHQaRUfbe65VEKPK9eyIKt7EV8xGMH9?=
 =?us-ascii?Q?BzwOpzcbZcKnwg446BpUr0+WKn/7Y0qIMAKK9qSVkiyQc5Ag9QA8rMefVGW2?=
 =?us-ascii?Q?cDW4U5TWzNchmB0+wqvVwmZXpcBbvMuNouaN0jrsehb3ZPSGESq/d4JLWfYv?=
 =?us-ascii?Q?jQv1fTtgdIP4oEM4tyWpCr3ma3XFEN8eGHhHayM1Rm529YcpuDl1mFbu4bf9?=
 =?us-ascii?Q?w7JhkYt4NCYqwDxpMrFLrYKZ5i8i6q6mo00YA/On3BrW/AxBHswpdneD8uWq?=
 =?us-ascii?Q?dnaSiw3DbRz1mpIGBVyHOu4MG05w9y3mO9HUqYoY9BLQTwVyzu4PwRRELi2O?=
 =?us-ascii?Q?cEGzvgfx37Hbb3Q86rDxwRu+SR8YXrfYK4nJS514/cSQBvJ8eEK01QQBhzuY?=
 =?us-ascii?Q?55txNqLljK9YfVpHxonVmQ+awYS2kdZ/HhLjgkfWF5hI46kLxhyJ7ViWz60r?=
 =?us-ascii?Q?q9+a+xmJheb9xN+D/h0HVNMO35hYMGYeCPv3BSeXxySEKwPVhRIdzehcowK6?=
 =?us-ascii?Q?L36Q0/3qUisJw++EWHmeHgrjXAlgaKVaBSQPR3rvPJZPFrxWwEwVUjFAPxnM?=
 =?us-ascii?Q?xJlhE1NOPPtb41capi9BF7K8uMCADZ+2ZNlHHlAp+EplLs9qKrQucv/QvUeZ?=
 =?us-ascii?Q?526+mCaHnHKaP2BG5aQe/grz5h2Nlt3EHkx79f/if/ggE7tyjuDjw8gxWvBN?=
 =?us-ascii?Q?DhxmvAUnu8PmYqUCF3uJ5rUQvboMSijqyhgeUlQKJculpkdXrEbVHY2DKXJg?=
 =?us-ascii?Q?j6CU/ccC34J4+YtLfxscYvVIth1xsvVth4yOXk3iTunJ5e8DiUsK15J3EeH4?=
 =?us-ascii?Q?P58H/raDawnQU1+ojPIBP4A3gmSB+jedLWq8MpKzS86SDe4ddK28tRhH7bP0?=
 =?us-ascii?Q?X+kcxNIw2su/NAOaFnQPUEx38rffWsTQJn762c8Exgz5CHVFah/4Qn1oiZZh?=
 =?us-ascii?Q?qnhGmfNIuYaMBKm55aq/CRt/rGFEd/k8XdtpDQoVNikpCAiTXyK7tRBg5tGA?=
 =?us-ascii?Q?Ys74/Wh24M2FhL8m08iQr2TLAaeTcTl1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gafV2JT7R7q03F8kXVN87WUxG3BNjs9vn0/3QV9P2G3Feo6QOwkeODqQTYuy?=
 =?us-ascii?Q?NJHgcd39m6dyRJqnmxzyNwXPbMBnbonj1Nheu1E5pXvQ0EByIEnypu8SzJah?=
 =?us-ascii?Q?jKNe7N2heOzYq8+2jaVKjhsugJKugVFuWzssolwL6g43XZLtJ8n+aKMgIGM9?=
 =?us-ascii?Q?smKqGPgQmHce0j/UkWJ6xYU4AM/IJzVbO7vq6YcDFCTmVf2cBd3/tI3O2120?=
 =?us-ascii?Q?OdwPBHvLHxq6/6rWNRlw6IQbxNQMWRpQi8Zq3XfOLj+mdcgly1QtRcrMkPZG?=
 =?us-ascii?Q?YFLApmbzqGVSl2g2wY0UfcFtD6vDABfjq6SlrSpW9WUxqgl/EoQfuCxxHdgX?=
 =?us-ascii?Q?zJBmpekeocq+YsE/GjPLYEvBA0WfWV+dfINcAtbNxGhms0QphkcfeUFhm57p?=
 =?us-ascii?Q?Jlry4JN9opiij8NTColB/ZPuCH/r2L7tQRQQlPA5KALiAbk1MqCLSx0Mi+Lj?=
 =?us-ascii?Q?pH5iCGgZ9bPmM6EjSPodcdi+sMHNHB6xLapsEWKAaPxbWZ4y2ogIsIebHpEa?=
 =?us-ascii?Q?XkOQd/93e+L4zvMuxcJ0kfYR1vpASSRDEtHZOa8cxLoVcIiN1b48xjrPYSET?=
 =?us-ascii?Q?Eh29BQxgOZ9ryjql1OcA+F92RLwqQ7ok2TyWuy+w+naifPjMMBQgQtLxTOYj?=
 =?us-ascii?Q?j6q3VB+kQO1Ny6O+Urpb2qkx8sSqWquAdxmU1rorK2mKyOfj7WZ39HQsjrK8?=
 =?us-ascii?Q?fLjLrJ7jDrFS/l7sf3cPBYd+TAjigmKGJJMLO2LMd8NoUlzSgYWYcf3kgGWJ?=
 =?us-ascii?Q?OPFN+4XP+98MFoHsx+T7HJM4nzv0GbVdRhfC9PE0L12jMgKlEP4gDtAhjoN3?=
 =?us-ascii?Q?yYn2i7cYHTFcGa5rZGMsImp5in82UgLdlAQD22VT2vlApSOn+sckZhJ58746?=
 =?us-ascii?Q?dzc3WMFNIyTHG8z9kObgQzWuEsqfVQU9YMQX45mwWLPV4Dly4GpyWClpE8J1?=
 =?us-ascii?Q?ioqT619H+UF7ou5Ef4/jFRC7NlONijBC0C88mFEBjHqZHBaJJCrNJFdiXACv?=
 =?us-ascii?Q?hWxZ6znwoLnZ1X55ofIohVkVX3w9Q2X+vHVYtgB/FWc1Y0fY7Rge7zs0OgLd?=
 =?us-ascii?Q?3xPpvvsiJKRNAcRZ+3EPxtKbWJAxVu1PP8VIDgoWlOtm3aPqLgzLKn9mF40c?=
 =?us-ascii?Q?3+jZlWY9IMoQq/L35xOzJphJvR+l+t3NFb1pERYS4LIFu25gUtnj4uuexQY7?=
 =?us-ascii?Q?84XZW42ZhtEB8JV4Wb9SS5zmxGWNfvce8kAqhfunJP7nrAeUvLlPMRq+xbhM?=
 =?us-ascii?Q?cn+1VMiuggTfKDifyHF1qKojpajk5LaiEsGSpd2H+riqdxH//SlzCWjkOLIc?=
 =?us-ascii?Q?iW9P7O0OVOmjXyJ7nVW8Ejkdg9oYyQ7fyFpAgdRxYlQ+XXFUjWoqz0f46IRT?=
 =?us-ascii?Q?azAqtVpmXMlILIgqB0J7krDq2qzb7jte41I+0Youmay84lyqGqgYaTpea2kz?=
 =?us-ascii?Q?EydA9/eqMvss2T+jT3ukLCLofnGtJG4IbAtMeiQMn+qAhWHUA4QaJ/b2V2z8?=
 =?us-ascii?Q?BQCy3T9HasHdpk5TsBemxaU1vNnQfzsUXw1WGtWZXGqdw8DE+/oJ5unOrh2R?=
 =?us-ascii?Q?AU0FgoOqejoholZtfEC7f/2hBm5Ao1WHALtKny8EDQRNWc64kjxdmbLLqt+U?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0On9n5qGOsZ2iFZFhAATbWzGQGRy4HIFUrPEtVDHdJkPeZexG9M92g8gGnoA654kVYHjuKvkV4AExSwHoAA4AIHHhUEUju8PUTuOpCoEI8E6O92bSWbIIzM86ah/MttLqtuF516J+GMVhlcEMkIpAzU9Ux+hv3ZRHiARRASypgsRUmSBpyx9xHdrZvPfMeLoOB5fwt383RWJLzo6RRDEqZ0Ft2b455altGQBZeo+u9x7iZJqSC9pDdUlFv2WyFi0FwIiEQ6srvBphKch9EUKRP3969oDNGMByZBVb6kcYTovrP8gHpovZWffXy81Br3Mwc9FmfL06aKtMH2N/27z47RbGktRW5i8HhBfnfb/m9XBmCGeQwW3BFBdCVRx10QAHH2vPmMer+qdoQV0Cg9gIssuq/5ovG/gONCY0Is2oSpzDiIaI66G8C0UqmLFffc3iR3wtCx5fMxiaVl/OsDbrK3u7QFHFi4nHbH30pkna/IvEGdrjymzAjbQp42BXCWxHUtqOlDFaewhv4o2f3NWCXUnyXs+TEsreZmDFJg9bLbiQW8aH1TuoZ6KFsssNV36Y0ct1wwQKTMrPHLJQNIE+3hiBYjqcz2FtAAe6hb7L34=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1220ba35-0ac0-4e87-d743-08dd835556a7
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 17:27:50.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1mnqBZwz+ffWj8HqokhaGU5AzpIUGIFR0p5uBqtb9LuG7/LQ0xI10I10TrMugoRcryXtEd+atBcvfOobcc9OOOQzPGaBcYLXjAoYT6DhyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6555
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504240120
X-Proofpoint-ORIG-GUID: JXn23fN8F1lgiiWuks2rZP1s8RHbvXNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExOSBTYWx0ZWRfX1nemcZbdN+i6 9ZLeKH2uTygVKpfKUagCnswFJnevO8mEvSUHYB1XspHw4MzVG2vKqQCMnnMXCj4dgzIb5KJDu2a W6oexLurX1O/gug7B/knBWdcIY1AbT102KbLNfczUdsNQLpI11eZLu8ll9C3jnUbcqSpKCGl8tt
 0EdxcOPIly7ppUZlRYjG6b+sKEhpl8jht377ZUrUSdCDRGhWdF2BC6JiH6Kopy7947tRFo5G91L pJc/nXGhq4zNwSfsemsG6dn4Wiu1/ve93rkuaOcrU1XGi0bnx0O9Q4xlGAmEqBBMBFeur26h+Oj +h/+fSBz3grjd7Pij6pAXEBtYVM9ZNBfBd5Ay1WMH+D+gJ0QcH+RTv+Dvy1apMvNDCmUbUs1Q1p +OJ89xvd
X-Proofpoint-GUID: JXn23fN8F1lgiiWuks2rZP1s8RHbvXNI

Nick,

Can you rework this patch based on current dev?  The changes to rework fbt
and rawfbt providers affects this patch quite a bit.

	Kris

On Tue, Feb 25, 2025 at 04:08:23PM -0500, Kris Van Hees wrote:
> ping?
> 
> On Fri, Nov 15, 2024 at 03:42:49PM -0500, Kris Van Hees wrote:
> > On Tue, Nov 12, 2024 at 01:42:56PM +0000, Nick Alcock wrote:
> > > So as of kernel 6.3 (upstream commit 2455f0e124d317dd08d337a75), the
> > > canonical tracefs location has moved to /sys/kernel/tracing.  Unfortunately
> > > this requires an explicit mount, and a great many installations have not
> > > done this and perhaps never will.  So if the debugfs is mounted on
> > > /sys/kernel/debug, it automatically makes /sys/kernel/debug/tracing appear
> > > as it used to, as another tracefs mount.  And of course there's nothing
> > > special about the "canonical location": it's up to the admin, who might
> > > choose to remount the thing anywhere at all.
> > > 
> > > To make this even more fun, it's quite possible to end up with the tracefs
> > > on /sys/kernel/debug/tracing, but an empty directory at /sys/kernel/tracing
> > > (I got that during testing with no effort at all).
> > > 
> > > All this means that the existing DTrace hardwiring for tracefs/eventsfs
> > > locations isn't good enough.  Instead, hunt for a suitable tracefs mount with
> > > getmntent(), and add a function to open files under that directory, allowing
> > > the path to be created using a printf-style format string (mimicking the
> > > things we used to do with EVENTSFS defines and the like).  This is actually
> > > all we need; there is no need to ever return these paths at all, so there
> > > is no clogging up the code with free()s -- and actually there's a
> > > noticeable simplification in most cases.
> > > 
> > > Tested with both in-practice-observed locations of debugfs, and the
> > > obviously crazy and bad-in-a-format-string path of "/%s/%s/%n" to make sure
> > > that is properly rejected.
> > 
> > I think it is useful to put the testing (and results) in the commit msg for
> > this, especially since you do not have a testcase for this (and I can
> > understand why - though if we were to use chroot or something a test could
> > be constructed, right).  And the case of tracefs *not* being in standard
> > location is worth pointing out to clearly show that this does work in the
> > most generic case.
> > 
> > Or if output of testing is too much to include (I assume it shouldn't be),
> > at least make sure you test standard and non-standard locations, and then
> > confidently report here that it works for all locations that do not have
> > % in the path name.
> > 
> > > Bug: https://github.com/oracle/dtrace-utils/issues/111
> > > Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> > > ---
> > >  include/tracefs.h                             | 14 ----
> > >  libdtrace/dt_error.c                          |  3 +-
> > >  libdtrace/dt_impl.h                           |  3 +
> > >  libdtrace/dt_open.c                           |  1 +
> > >  libdtrace/dt_prov_dtrace.c                    | 27 +++----
> > >  libdtrace/dt_prov_fbt.c                       | 37 ++++-----
> > >  libdtrace/dt_prov_rawtp.c                     |  9 ++-
> > >  libdtrace/dt_prov_sdt.c                       | 30 ++++---
> > >  libdtrace/dt_prov_syscall.c                   | 27 ++++---
> > >  libdtrace/dt_prov_uprobe.c                    | 41 +++++-----
> > >  libdtrace/dt_provider.h                       |  1 -
> > >  libdtrace/dt_subr.c                           | 80 +++++++++++++++++++
> > >  runtest.sh                                    |  8 ++
> > >  test/unittest/funcs/tst.rw_.x                 |  7 +-
> > >  test/unittest/providers/tst.dtrace_cleanup.sh |  9 ++-
> > >  test/utils/clean_probes.sh                    | 12 ++-
> > >  16 files changed, 203 insertions(+), 106 deletions(-)
> > >  delete mode 100644 include/tracefs.h
> > > 
> > > diff --git a/include/tracefs.h b/include/tracefs.h
> > > deleted file mode 100644
> > > index d671f51adefc..000000000000
> > > --- a/include/tracefs.h
> > > +++ /dev/null
> > > @@ -1,14 +0,0 @@
> > > -/*
> > > - * Oracle Linux DTrace; simple uprobe helper functions
> > > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > > - * Licensed under the Universal Permissive License v 1.0 as shown at
> > > - * http://oss.oracle.com/licenses/upl.
> > > - */
> > > -
> > > -#ifndef	_TRACEFS_H
> > > -#define	_TRACEFS_H
> > > -
> > > -#define TRACEFS		"/sys/kernel/debug/tracing/"
> > > -#define EVENTSFS	TRACEFS "events/"
> > > -
> > > -#endif /* _TRACEFS_H */
> > > diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
> > > index 213f0d9e1385..9c4a2b32888e 100644
> > > --- a/libdtrace/dt_error.c
> > > +++ b/libdtrace/dt_error.c
> > > @@ -98,7 +98,8 @@ static const struct {
> > >  	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
> > >  	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
> > >  	{ EDT_PCAP, "Missing or corrupt pcap() record" },
> > > -	{ EDT_PRINT, "Missing or corrupt print() record" }
> > > +	{ EDT_PRINT, "Missing or corrupt print() record" },
> > > +	{ EDT_TRACEFS, "Cannot find tracefs" }
> > >  };
> > >  
> > >  static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
> > > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > > index 68fb8ec53c06..950cb34819aa 100644
> > > --- a/libdtrace/dt_impl.h
> > > +++ b/libdtrace/dt_impl.h
> > > @@ -354,6 +354,7 @@ struct dtrace_hdl {
> > >  	char *dt_module_path;	/* pathname of kernel module root */
> > >  	dt_version_t dt_kernver;/* kernel version, used in the libpath */
> > >  	char *dt_dofstash_path;	/* Path to the DOF stash.  */
> > > +	char *dt_tracefs_path;	/* Path to tracefs.  */
> > >  	uid_t dt_useruid;	/* lowest non-system uid: set via -xuseruid */
> > >  	char *dt_sysslice;	/* the systemd system slice: set via -xsysslice */
> > >  	uint_t dt_lazyload;	/* boolean:  set via -xlazyload */
> > > @@ -643,6 +644,7 @@ enum {
> > >  	EDT_TRACEMEM,		/* missing or corrupt tracemem() record */
> > >  	EDT_PCAP,		/* missing or corrupt pcap() record */
> > >  	EDT_PRINT,		/* missing or corrupt print() record */
> > > +	EDT_TRACEFS,		/* cannot find tracefs */
> > >  };
> > >  
> > >  /*
> > > @@ -713,6 +715,7 @@ extern void dt_conf_init(dtrace_hdl_t *);
> > >  
> > >  extern int dt_gmatch(const char *, const char *);
> > >  extern char *dt_basename(char *);
> > > +extern int dt_tracefs_open(dtrace_hdl_t *, const char *fn, int flags, ...);
> > >  
> > >  extern ulong_t dt_popc(ulong_t);
> > >  extern ulong_t dt_popcb(const ulong_t *, ulong_t);
> > > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > > index e1972aa821e7..775830f64492 100644
> > > --- a/libdtrace/dt_open.c
> > > +++ b/libdtrace/dt_open.c
> > > @@ -1317,6 +1317,7 @@ dtrace_close(dtrace_hdl_t *dtp)
> > >  	free(dtp->dt_cpp_argv);
> > >  	free(dtp->dt_cpp_path);
> > >  	free(dtp->dt_ld_path);
> > > +	free(dtp->dt_tracefs_path);
> > >  	free(dtp->dt_sysslice);
> > >  	free(dtp->dt_dofstash_path);
> > >  
> > > diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> > > index 34b5d8e2467f..670954beb4c9 100644
> > > --- a/libdtrace/dt_prov_dtrace.c
> > > +++ b/libdtrace/dt_prov_dtrace.c
> > > @@ -23,8 +23,6 @@ static const char		funname[] = "";
> > >  
> > >  #define PROBE_FUNC_SUFFIX	"_probe"
> > >  
> > > -#define UPROBE_EVENTS		TRACEFS "uprobe_events"
> > 
> > Since you keep KPROBE_EVENTS etc in other providers, why not here?
> > 
> > > -
> > >  static const dtrace_pattr_t	pattr = {
> > >  { DTRACE_STABILITY_STABLE, DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON },
> > >  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> > > @@ -229,11 +227,9 @@ out:
> > >  static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> > >  {
> > >  	if (!dt_tp_probe_has_info(prp)) {
> > > -		char	*spec;
> > > -		char	*fn;
> > > -		FILE	*f;
> > > -		size_t	len;
> > > -		int	fd, rc = -1;
> > > +		char		*spec;
> > > +		FILE		*f;
> > > +		int		fd = -1, rc = -1;
> > >  
> > >  		/* get a uprobe specification for this probe */
> > >  		spec = uprobe_spec(getpid(), prp->desc->prb);
> > > @@ -241,7 +237,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> > >  			return -ENOENT;
> > >  
> > >  		/* add a uprobe */
> > > -		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> > > +		fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> > > +
> > >  		if (fd != -1) {
> > >  			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
> > >  				     GROUP_DATA, prp->desc->prb, spec);
> > > @@ -252,16 +249,12 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> > >  			return -ENOENT;
> > >  
> > >  		/* open format file */
> > > -		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
> > > -			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
> > > -		fn = dt_alloc(dtp, len);
> > > -		if (fn == NULL)
> > > +		fd = dt_tracefs_open(dtp, "events/" GROUP_FMT "/%s/format",
> > > +				     O_RDONLY, GROUP_DATA, prp->desc->prb);
> > > +		if (fd < 0)
> > >  			return -ENOENT;
> > >  
> > > -		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
> > > -			 EVENTSFS, GROUP_DATA, prp->desc->prb);
> > > -		f = fopen(fn, "r");
> > > -		dt_free(dtp, fn);
> > > +		f = fdopen(fd, "r");
> > >  		if (f == NULL)
> > >  			return -ENOENT;
> > >  
> > > @@ -296,7 +289,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> > >  
> > >  	dt_tp_probe_detach(dtp, prp);
> > >  
> > > -	fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> > > +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> > >  	if (fd == -1)
> > >  		return;
> > >  
> > > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > > index 21f63ddffc73..b5c1f5d22a06 100644
> > > --- a/libdtrace/dt_prov_fbt.c
> > > +++ b/libdtrace/dt_prov_fbt.c
> > > @@ -43,8 +43,8 @@
> > >  static const char		prvname[] = "fbt";
> > >  static const char		modname[] = "vmlinux";
> > >  
> > > -#define KPROBE_EVENTS		TRACEFS "kprobe_events"
> > > -#define PROBE_LIST		TRACEFS "available_filter_functions"
> > > +#define KPROBE_EVENTS		"kprobe_events"
> > > +#define PROBE_LIST		"available_filter_functions"
> > >  
> > >  #define FBT_GROUP_FMT		GROUP_FMT "_%s"
> > >  #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> > > @@ -65,6 +65,7 @@ static int populate(dtrace_hdl_t *dtp)
> > >  {
> > >  	dt_provider_t		*prv;
> > >  	dt_provimpl_t		*impl;
> > > +	int			fd;
> > >  	FILE			*f;
> > >  	char			*buf = NULL;
> > >  	char			*p;
> > > @@ -79,7 +80,11 @@ static int populate(dtrace_hdl_t *dtp)
> > >  	if (prv == NULL)
> > >  		return -1;			/* errno already set */
> > >  
> > > -	f = fopen(PROBE_LIST, "r");
> > > +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> > > +	if (fd < 0)
> > > +		return 0;
> > > +
> > > +	f = fdopen(fd, "r");
> > >  	if (f == NULL)
> > >  		return 0;
> > >  
> > > @@ -363,16 +368,14 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > >  static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> > >  {
> > >  	if (!dt_tp_probe_has_info(prp)) {
> > > -		char	*fn;
> > > -		FILE	*f;
> > > -		size_t	len;
> > > -		int	fd, rc = -1;
> > > +		FILE		*f;
> > > +		int		fd, rc = -1;
> > >  
> > >  		/*
> > >  		 * Register the kprobe with the tracing subsystem.  This will
> > >  		 * create a tracepoint event.
> > >  		 */
> > > -		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> > > +		fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
> > >  		if (fd == -1)
> > >  			return -ENOENT;
> > >  
> > > @@ -383,19 +386,13 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> > >  		if (rc == -1)
> > >  			return -ENOENT;
> > >  
> > > -		/* create format file name */
> > > -		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> > > -			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
> > > -		fn = dt_alloc(dtp, len);
> > > -		if (fn == NULL)
> > > +		/* open format file */
> > > +		fd = dt_tracefs_open(dtp, "events/" FBT_GROUP_FMT "/%s/format",
> > > +				     O_RDONLY, FBT_GROUP_DATA, prp->desc->fun);
> > > +		if (fd < 0)
> > >  			return -ENOENT;
> > >  
> > > -		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> > > -			 FBT_GROUP_DATA, prp->desc->fun);
> > > -
> > > -		/* open format file */
> > > -		f = fopen(fn, "r");
> > > -		dt_free(dtp, fn);
> > > +		f = fdopen(fd, "r");
> > >  		if (f == NULL)
> > >  			return -ENOENT;
> > >  
> > > @@ -431,7 +428,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> > >  
> > >  	dt_tp_probe_detach(dtp, prp);
> > >  
> > > -	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> > > +	fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
> > >  	if (fd == -1)
> > >  		return;
> > >  
> > > diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
> > > index 778a6f9cde90..6940edce6a6d 100644
> > > --- a/libdtrace/dt_prov_rawtp.c
> > > +++ b/libdtrace/dt_prov_rawtp.c
> > > @@ -38,7 +38,7 @@
> > >  static const char		prvname[] = "rawtp";
> > >  static const char		modname[] = "vmlinux";
> > >  
> > > -#define PROBE_LIST		TRACEFS "available_events"
> > > +#define PROBE_LIST		"available_events"
> > >  
> > >  #define KPROBES			"kprobes"
> > >  #define SYSCALLS		"syscalls"
> > > @@ -64,6 +64,7 @@ static const dtrace_pattr_t	pattr = {
> > >  static int populate(dtrace_hdl_t *dtp)
> > >  {
> > >  	dt_provider_t	*prv;
> > > +	int		fd;
> > >  	FILE		*f;
> > >  	char		*buf = NULL;
> > >  	char		*p;
> > > @@ -73,7 +74,11 @@ static int populate(dtrace_hdl_t *dtp)
> > >  	if (prv == NULL)
> > >  		return -1;			/* errno already set */
> > >  
> > > -	f = fopen(PROBE_LIST, "r");
> > > +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> > > +	if (fd < 0)
> > > +		return 0;
> > > +
> > > +	f = fdopen(fd, "r");
> > >  	if (f == NULL)
> > >  		return 0;
> > >  
> > > diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> > > index 675e0458ca4c..7ebe010efa79 100644
> > > --- a/libdtrace/dt_prov_sdt.c
> > > +++ b/libdtrace/dt_prov_sdt.c
> > > @@ -36,7 +36,7 @@
> > >  static const char		prvname[] = "sdt";
> > >  static const char		modname[] = "vmlinux";
> > >  
> > > -#define PROBE_LIST		TRACEFS "available_events"
> > > +#define PROBE_LIST		"available_events"
> > >  
> > >  #define KPROBES			"kprobes"
> > >  #define SYSCALLS		"syscalls"
> > > @@ -62,6 +62,7 @@ static const dtrace_pattr_t	pattr = {
> > >  static int populate(dtrace_hdl_t *dtp)
> > >  {
> > >  	dt_provider_t	*prv;
> > > +	int		fd;
> > >  	FILE		*f;
> > >  	char		*buf = NULL;
> > >  	char		*p;
> > > @@ -71,7 +72,11 @@ static int populate(dtrace_hdl_t *dtp)
> > >  	if (prv == NULL)
> > >  		return -1;			/* errno already set */
> > >  
> > > -	f = fopen(PROBE_LIST, "r");
> > > +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> > > +	if (fd < 0)
> > > +		return 0;
> > > +
> > > +	f = fdopen(fd, "r");
> > >  	if (f == NULL)
> > >  		return 0;
> > >  
> > > @@ -192,16 +197,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > >  static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> > >  			      int *argcp, dt_argdesc_t **argvp)
> > >  {
> > > +	int				fd;
> > >  	FILE				*f;
> > > -	char				*fn;
> > >  	int				rc;
> > >  	const dtrace_probedesc_t	*pdp = prp->desc;
> > >  
> > > -	if (asprintf(&fn, EVENTSFS "%s/%s/format", pdp->mod, pdp->prb) == -1)
> > > -		return dt_set_errno(dtp, EDT_NOMEM);
> > > +	fd = dt_tracefs_open(dtp, "events/%s/%s/format", O_RDONLY, pdp->mod, pdp->prb);
> > > +	if (fd < 0)
> > > +		return -ENOENT;
> > >  
> > > -	f = fopen(fn, "r");
> > > -	free(fn);
> > > +	f = fdopen(fd, "r");
> > >  	if (!f)
> > >  		return -ENOENT;
> > >  
> > > @@ -223,15 +228,18 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> > >  	int			argc = 0;
> > >  	dt_argdesc_t		*argv = NULL;
> > >  	dtrace_typeinfo_t	sym;
> > > +	int			fd;
> > >  	FILE			*f;
> > >  	uint32_t		id;
> > >  
> > >  	/* Retrieve the event id. */
> > > -	if (asprintf(&str, EVENTSFS "%s/%s/id", prp->desc->mod, prp->desc->prb) == -1)
> > > -		return dt_set_errno(dtp, EDT_NOMEM);
> > >  
> > > -	f = fopen(str, "r");
> > > -	free(str);
> > > +	fd = dt_tracefs_open(dtp, "events/%s/%s/id", O_RDONLY,
> > > +			     prp->desc->mod, prp->desc->prb);
> > > +	if (fd < 0)
> > > +		return dt_set_errno(dtp, EDT_ENABLING_ERR);
> > > +
> > > +	f = fdopen(fd, "r");
> > >  	if (!f)
> > >  		return dt_set_errno(dtp, EDT_ENABLING_ERR);
> > >  
> > > diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
> > > index 20843c6f538e..63ce3bc43ae1 100644
> > > --- a/libdtrace/dt_prov_syscall.c
> > > +++ b/libdtrace/dt_prov_syscall.c
> > > @@ -38,7 +38,7 @@
> > >  static const char		prvname[] = "syscall";
> > >  static const char		modname[] = "vmlinux";
> > >  
> > > -#define SYSCALLSFS		EVENTSFS "syscalls/"
> > > +#define SYSCALLSFS		"events/syscalls/"
> > >  
> > >  /*
> > >   * We need to skip over an extra field: __syscall_nr.
> > > @@ -61,7 +61,7 @@ struct syscall_data {
> > >  
> > >  #define SCD_ARG(n)	offsetof(struct syscall_data, arg[n])
> > >  
> > > -#define PROBE_LIST	TRACEFS "available_events"
> > > +#define PROBE_LIST	"available_events"
> > >  
> > >  #define PROV_PREFIX	"syscalls:"
> > >  #define ENTRY_PREFIX	"sys_enter_"
> > > @@ -71,6 +71,7 @@ struct syscall_data {
> > >  static int populate(dtrace_hdl_t *dtp)
> > >  {
> > >  	dt_provider_t	*prv;
> > > +	int		fd;
> > >  	FILE		*f;
> > >  	char		*buf = NULL;
> > >  	size_t		n;
> > > @@ -79,7 +80,11 @@ static int populate(dtrace_hdl_t *dtp)
> > >  	if (prv == NULL)
> > >  		return -1;			/* errno already set */
> > >  
> > > -	f = fopen(PROBE_LIST, "r");
> > > +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> > > +	if (fd < 0)
> > > +		return 0;
> > > +
> > > +	f = fdopen(fd, "r");
> > >  	if (f == NULL)
> > >  		return 0;
> > >  
> > > @@ -195,23 +200,21 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > >  static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> > >  		      int *argcp, dt_argdesc_t **argvp)
> > >  {
> > > +	int		fd;
> > >  	FILE		*f;
> > > -	char		fn[256];
> > >  	int		rc;
> > >  
> > >  	/*
> > >  	 * We know that the probe name is either "entry" or "return", so we can
> > >  	 * just check the first character.
> > >  	 */
> > > -	strcpy(fn, SYSCALLSFS);
> > > -	if (prp->desc->prb[0] == 'e')
> > > -		strcat(fn, "sys_enter_");
> > > -	else
> > > -		strcat(fn, "sys_exit_");
> > > -	strcat(fn, prp->desc->fun);
> > > -	strcat(fn, "/format");
> > > +	fd = dt_tracefs_open(dtp, SYSCALLSFS "/sys_%s_%s/format", O_RDONLY,
> > > +			     (prp->desc->prb[0] == 'e') ? "enter" : "exit",
> > > +			     prp->desc->fun);
> > > +	if (fd < 0)
> > > +		return -ENOENT;
> > >  
> > > -	f = fopen(fn, "r");
> > > +	f = fdopen(fd, "r");
> > >  	if (!f)
> > >  		return -ENOENT;
> > >  
> > > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > > index 205014617586..6a02243ff572 100644
> > > --- a/libdtrace/dt_prov_uprobe.c
> > > +++ b/libdtrace/dt_prov_uprobe.c
> > > @@ -1116,13 +1116,13 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
> > >   * uprobe may be a uretprobe.  Return the probe's name as
> > >   * a new dynamically-allocated string, or NULL on error.
> > >   */
> > > -static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> > > -			   uint64_t addr, int flags)
> > > +static char *uprobe_create(dtrace_hdl_t *dtp, dev_t dev, ino_t ino,
> > > +			   const char *mapping_fn, uint64_t addr, int flags)
> > >  {
> > > -	int	fd = -1;
> > > -	int	rc = -1;
> > > -	char	*name;
> > > -	char	*spec;
> > > +	int		fd = -1;
> > > +	int		rc = -1;
> > > +	char		*name;
> > > +	char		*spec;
> > >  
> > >  	if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
> > >  		return NULL;
> > > @@ -1132,8 +1132,8 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> > >  		goto out;
> > >  
> > >  	/* Add the uprobe. */
> > > -	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
> > > -	if (fd == -1)
> > > +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> > > +	if (fd < 0)
> > >  		goto out;
> > >  
> > >  	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
> > > @@ -1153,8 +1153,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
> > >  {
> > >  	dt_uprobe_t	*upp = uprp->prv_data;
> > >  	tp_probe_t	*tpp = upp->tp;
> > > +	int		fd;
> > >  	FILE		*f;
> > > -	char		*fn;
> > >  	char		*prb = NULL;
> > >  	int		rc = -1;
> > >  
> > > @@ -1163,7 +1163,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
> > >  
> > >  	assert(upp->fn != NULL);
> > >  
> > > -	prb = uprobe_create(upp->dev, upp->inum, upp->fn, upp->off,
> > > +	prb = uprobe_create(dtp, upp->dev, upp->inum, upp->fn, upp->off,
> > >  			    upp->flags);
> > >  
> > >  	/*
> > > @@ -1177,12 +1177,12 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
> > >  				  upp->flags);
> > >  
> > >  	/* open format file */
> > > -	rc = asprintf(&fn, "%s%s/format", EVENTSFS, prb);
> > > +	fd = dt_tracefs_open(dtp, "events/%s/format", O_RDONLY, prb);
> > >  	free(prb);
> > > -	if (rc < 0)
> > > +	if (fd < 0)
> > >  		return -ENOENT;
> > > -	f = fopen(fn, "r");
> > > -	free(fn);
> > > +
> > > +	f = fdopen(fd, "r");
> > >  	if (f == NULL)
> > >  		return -ENOENT;
> > >  
> > > @@ -1251,21 +1251,20 @@ done:
> > >   * Destroy a uprobe for a given device and address.
> > >   */
> > >  static int
> > > -uprobe_delete(dev_t dev, ino_t ino, uint64_t addr, int flags)
> > > +uprobe_delete(dtrace_hdl_t *dtp, dev_t dev, ino_t ino, uint64_t addr, int flags)
> > >  {
> > > -	int	fd = -1;
> > > -	int	rc = -1;
> > > -	char	*name;
> > > +	int		fd = -1;
> > > +	int		rc = -1;
> > > +	char		*name;
> > >  
> > >  	name = uprobe_name(dev, ino, addr, flags);
> > >  	if (!name)
> > >  		goto out;
> > >  
> > > -	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
> > > +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> > >  	if (fd == -1)
> > >  		goto out;
> > >  
> > > -
> > >  	rc = dprintf(fd, "-:%s\n", name);
> > >  
> > >  out:
> > > @@ -1297,7 +1296,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
> > >  
> > >  	dt_tp_detach(dtp, tpp);
> > >  
> > > -	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
> > > +	uprobe_delete(dtp, upp->dev, upp->inum, upp->off, upp->flags);
> > >  }
> > >  
> > >  /*
> > > diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> > > index 8f143dceaed7..4598a380b950 100644
> > > --- a/libdtrace/dt_provider.h
> > > +++ b/libdtrace/dt_provider.h
> > > @@ -12,7 +12,6 @@
> > >  #include <dt_impl.h>
> > >  #include <dt_ident.h>
> > >  #include <dt_list.h>
> > > -#include <tracefs.h>
> > >  
> > >  #ifdef	__cplusplus
> > >  extern "C" {
> > > diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
> > > index d5dca164861e..f129e5591465 100644
> > > --- a/libdtrace/dt_subr.c
> > > +++ b/libdtrace/dt_subr.c
> > > @@ -20,6 +20,7 @@
> > >  #include <assert.h>
> > >  #include <limits.h>
> > >  #include <sys/ioctl.h>
> > > +#include <mntent.h>
> > >  #include <port.h>
> > >  
> > >  #include <dt_impl.h>
> > > @@ -998,3 +999,82 @@ uint32_t dt_gen_hval(const char *p, uint32_t hval, size_t len)
> > >  
> > >  	return hval;
> > >  }
> > > +
> > > +/*
> > > + * Find the tracefs and store it away in dtp.
> > > + */
> > > +static int
> > > +find_tracefs_path(dtrace_hdl_t *dtp)
> > > +{
> > > +	FILE *mounts;
> > > +	struct mntent *mnt;
> > > +
> > > +	if ((mounts = setmntent("/proc/mounts", "r")) == NULL) {
> > > +		dt_dprintf("Cannot open /proc/mounts: %s\n", strerror(errno));
> > > +		return dt_set_errno(dtp, EDT_TRACEFS);
> > > +	}
> > > +
> > > +	while ((mnt = getmntent(mounts)) != NULL) {
> > > +		/*
> > > +		 * Only accept tracefs paths that do not contain percent
> > > +		 * characters in their mounted paths, since we use this
> > > +		 * to augment a format string in dt_tracefs_vfn().
> > > +		 */
> > > +		if ((strcmp(mnt->mnt_type, "tracefs") == 0) &&
> > > +		    (strchr(mnt->mnt_dir, '%') == NULL)) {
> > > +			dtp->dt_tracefs_path = strdup(mnt->mnt_dir);
> > > +			break;
> > > +		}
> > > +	}
> > > +	endmntent(mounts);
> > > +
> > > +	if (!dtp->dt_tracefs_path) {
> > > +		dt_dprintf("Cannot find a suitable tracefs path.\n");
> > > +		return dt_set_errno(dtp, EDT_TRACEFS);
> > > +	}
> > > +
> > > +	dt_dprintf("Found tracefs at %s\n", dtp->dt_tracefs_path);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static char *
> > > +dt_tracefs_vfn(dtrace_hdl_t *dtp, const char *fn, va_list ap)
> > > +{
> > > +	char *full_fn;
> > > +	char *str;
> > > +
> > > +	if (!dtp->dt_tracefs_path)
> > > +		if (find_tracefs_path(dtp) < 0)
> > > +			return NULL;		/* errno is set for us. */
> > > +
> > > +	if (asprintf(&full_fn, "%s/%s", dtp->dt_tracefs_path, fn) < 0) {
> > > +		dt_set_errno(dtp, EDT_NOMEM);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	if (vasprintf(&str, full_fn, ap) < 0) {
> > > +		str = NULL;
> > > +		dt_set_errno(dtp, EDT_NOMEM);
> > > +	}
> > > +	free(full_fn);
> > > +	return str;
> > > +}
> > > +
> > > +int
> > > +dt_tracefs_open(dtrace_hdl_t *dtp, const char *fn, int flags, ...)
> > > +{
> > > +	va_list ap;
> > > +	char *str;
> > > +	int fd;
> > > +
> > > +	va_start(ap, flags);
> > > +	if ((str = dt_tracefs_vfn(dtp, fn, ap)) == NULL) {
> > > +		va_end(ap);
> > > +		return -1; 			/* errno is set for us. */
> > > +	}
> > > +
> > > +	fd = open(str, flags, 0666);
> > > +	free(str);
> > > +	return fd;				/* errno is set for us. */
> > > +}
> > > diff --git a/runtest.sh b/runtest.sh
> > > index 46b532d7e161..fbf4e60c82a9 100755
> > > --- a/runtest.sh
> > > +++ b/runtest.sh
> > > @@ -607,6 +607,14 @@ elif ! /usr/bin/cpp -x c -fno-show-column - /dev/null < /dev/null 2>&1 | \
> > >      export DTRACE_OPT_CPPARGS="-fno-show-column"
> > >  fi
> > >  
> > > +# Find the tracefs.
> > > +tracefs="$(awk '$3 == "tracefs" { print $2; exit; }' /proc/mounts)"
> > > +if [[ -z $tracefs ]]; then
> > > +    echo "Cannot find any tracefs mounts in /proc/mounts.  Some tests will fail." >&2
> > > +fi
> > > +
> > > +export tracefs
> > > +
> > >  # More than one dtrace tree -> run tests for all dtraces, and verify identical
> > >  # intermediate code is produced by each dtrace.
> > >  
> > > diff --git a/test/unittest/funcs/tst.rw_.x b/test/unittest/funcs/tst.rw_.x
> > > index 29c581116154..5737c7575a26 100755
> > > --- a/test/unittest/funcs/tst.rw_.x
> > > +++ b/test/unittest/funcs/tst.rw_.x
> > > @@ -1,6 +1,11 @@
> > >  #!/bin/sh
> > >  
> > > -FUNCS=/sys/kernel/debug/tracing/available_filter_functions
> > > +FUNCS=${tracefs}/available_filter_functions
> > > +
> > > +if [[ ! -e $FUNCS ]]; then
> > > +	echo no tracefs found
> > > +	exit 1
> > > +fi
> > >  
> > >  if ! grep -qw  _raw_read_lock $FUNCS; then
> > >          echo no _raw_read_lock FBT probe due to kernel config
> > > diff --git a/test/unittest/providers/tst.dtrace_cleanup.sh b/test/unittest/providers/tst.dtrace_cleanup.sh
> > > index 4ac59ccb4315..f3e434ae76fc 100755
> > > --- a/test/unittest/providers/tst.dtrace_cleanup.sh
> > > +++ b/test/unittest/providers/tst.dtrace_cleanup.sh
> > > @@ -1,7 +1,7 @@
> > >  #!/bin/bash
> > >  #
> > >  # Oracle Linux DTrace.
> > > -# Copyright (c) 2020, 2022, Oracle and/or its affiliates. All rights reserved.
> > > +# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
> > >  # Licensed under the Universal Permissive License v 1.0 as shown at
> > >  # http://oss.oracle.com/licenses/upl.
> > >  
> > > @@ -14,7 +14,12 @@
> > >  ##
> > >  
> > >  dtrace=$1
> > > -UPROBE_EVENTS=/sys/kernel/debug/tracing/uprobe_events
> > > +UPROBE_EVENTS=${tracefs}/uprobe_events
> > > +
> > > +if [[ ! -e $UPROBE_EVENTS ]]; then
> > > +	echo "no tracefs/uprobe_events" >&2
> > > +	exit 67
> > > +fi
> > >  
> > >  out=/tmp/output.$$
> > >  $dtrace $dt_flags -n BEGIN,END &>> $out &
> > > diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
> > > index 8292b3096424..cfd100088eb7 100755
> > > --- a/test/utils/clean_probes.sh
> > > +++ b/test/utils/clean_probes.sh
> > > @@ -1,9 +1,13 @@
> > >  #!/usr/bin/bash
> > >  
> > > -TRACEFS=/sys/kernel/debug/tracing
> > > -EVENTS=${TRACEFS}/available_events
> > > -KPROBES=${TRACEFS}/kprobe_events
> > > -UPROBES=${TRACEFS}/uprobe_events
> > > +EVENTS=${tracefs}/available_events
> > > +KPROBES=${tracefs}/kprobe_events
> > > +UPROBES=${tracefs}/uprobe_events
> > > +
> > > +# We can't work without the tracefs: just give up quietly.
> > > +if [[ ! -e $EVENTS ]]; then
> > > +    exit 0
> > > +fi
> > >  
> > >  # Check permissions
> > >  if [[ ! -r ${EVENTS} ]]; then
> > > -- 
> > > 2.46.0.278.g36e3a12567
> > > 
