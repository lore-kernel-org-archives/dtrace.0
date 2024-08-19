Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FEA5C613
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110259; cv=fail; b=O3WYKJgljwcDUiLJIRNPWmla3kwyeaIRp97ihx8Vdn0L3v5rBsGhnoIKO9yaOr/EEPaAMWgGWgS2ufXIhHbLSC3YsoMciOHJ32KvONHzsgJCGYzaGFS8wpJPa+X2P5NFtY65ovkOdL0oKEDO4aEpYYay+nDz7/3meAgnoH05mcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110259; c=relaxed/simple;
	bh=JFonHP9mNcmAiiiFDV6EWBa13aNcPU6yGCbKsB5mBBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZWMFq5mIOYhPcQp3Ge3B7qlkowA4UfYkDRuV7tECgTm1f7hLM+sxcGnzvJXvCOE+26VDtZ2y5TnVXFXby2GMQIfYZmc5rDQiwEnFg1HMrPpTWg4g1DH9lU47IWpFNNaipOuIVvF5MkyGDpJglKejUmOqhnXYVOyF3IeOa0bSZrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KbOkkG7X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vWSXJl84; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KbOkkG7X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vWSXJl84"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLKIBE016488
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Gmgu/LfHMaQeYcY
	qSZC61h0JA1504C5c12cJAI/40UU=; b=KbOkkG7XntTcxPUvY8auwAWwQuQuL7+
	GWdY+8g5SMwxmJ7Ha/AjGeMONmjiRGBNiJrNY+4M5/zFV6g1vu1eIExGN+NTyT9x
	jZrdRT15WLgcIfeWHD2GsI0/f7GZhLptkKBYr9rspJUJBc+Dq40KzFZYxb71vZzA
	F/aUskdrZvd7FejxkYmYEtJsybgw9RoI8erc1WJ7RTTGMqB5HN2qYXmx1SSqk7zO
	95Csw2VgPblBgQawiAnw6HdmAIReY7kaEf6Gjr9ado6CFTEkDe39Z7/UAEePJIWA
	Fomio+696U42WlOm6IVtDmRrykFj1eDKY+n4ZLgUkJvK1KBLRECzSxQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412mdsustg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:30:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JNDsJC026551
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:30:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 414fht8b7n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:30:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtxTQ1VHNI0XiiAINRhw6odU3IvnjG71eM+tpCE60LEdUv590XphPesSCUF+pedA1bs6cxrm71RWTmnOlrxj90kThyy1OhzRDdpGUsJ3a/aBkaykd02AknvaMH2gxkiGqUoMn6oD4KQXKR944oL92ZCXOn5Lt2M2THT1cT9BKZd5t482byZopaJsnpKALG/f95tqVvLhkMum5V+3HgqeKPTfBO1BKMeDws2W8rQPFr4nn5VMK+G+tSZLF/DNI1wT4dzFYO0V2ipyp7dHFXpt/AYJlJcVvQnYjUKZMOHwOxdTRGcfrb9qq1+ik0mHJmxVjvr5gQAocDpFnp6qF+WVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gmgu/LfHMaQeYcYqSZC61h0JA1504C5c12cJAI/40UU=;
 b=Ge6gIWh47wprzP9FIIcrrrLuYqkzS/WUu+NQY17wMaO51OzWS3rRW1udO22QNUuVZR3LvN21/P0q0ReJyB8t/l/35zeAIOcXPW5kF+PW/nxOMj3kRg4N7Q9l2hkkZCUKObutto8sxrxh4gNspnhqVHE93q9xaysPbVL0UCOkLZpDFTwQp8BqpW5+7CblLG4bbZ87ADyMNQFOV11GOZyY49KNci+09x7hvRK2uAUlt8bdyF0PhHTW+5SQ1L27YCVQVKf1h7Q8Z3N0qHJVfqSMFuxcO03of8qyLpHqxweUbeClOnCLGlPi4SmCpBl88X7oxDwHolWxrNzW4DsfC2kE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gmgu/LfHMaQeYcYqSZC61h0JA1504C5c12cJAI/40UU=;
 b=vWSXJl844pU4PpC6fTH8z0+Vw9ToSJ05Kzp8Bn70t+WfsAL3ByFzUOzoMj8mxNS1L5RP3DXEX3cxdDXv3S49kyJOz9h5nC8rp54bQQiv93vbazJKJ7xRM20/aYs6TidVQBnOcouRh5Te83l60I5PmfjyiFFEROZUm+aaO+XdbLU=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BY5PR10MB4209.namprd10.prod.outlook.com (2603:10b6:a03:207::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.11; Mon, 19 Aug
 2024 23:30:52 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Mon, 19 Aug 2024
 23:30:52 +0000
Date: Mon, 19 Aug 2024 19:30:50 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/8] Reduce stack depth if kernel returns
 NULL frames
Message-ID: <ZsPVqitlZpZp2lcA@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604180008.11331-2-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:208:23a::14) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BY5PR10MB4209:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d92bcc-fdd8-4509-a167-08dcc0a6f743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4DmV79RXDKU/sLkG/OvXbIhFGHnNqO0HKB4ukj8fMGIE1KqLd+H4fLv3IUzH?=
 =?us-ascii?Q?CfYS58Ri9qkpSRsLCmDgvBr/OdzB/nJsZX9VEMKYF50VHvU2xYoNlJvy+dJh?=
 =?us-ascii?Q?eSzfPJDtXnDARp6Y8KasZh3RToGmpgQArEBDeP+ci9z9bCDw4PwqiEEtX83c?=
 =?us-ascii?Q?AxRkrHYIah01m4l2Uzs9kR1lL9wTJIYJqSWhOnhGrwwlEykfN1ng+Fv4QVjF?=
 =?us-ascii?Q?mzACmxWiUhtvealOsmiHNv2qQM1+vI/aC5XYF9voRQ5L/IPr3SO9yZ2rRTmM?=
 =?us-ascii?Q?sKupdB0FkTEggPAsAWzJW0ib5AmIWsv6o4IVYhGHcua93iGb+AodcSDVcqNb?=
 =?us-ascii?Q?K64HLRn8QgB1nteDKJYeWApkG8njnUyIQpRFOwTNjbqfIxD0o7gcVqKV9lsK?=
 =?us-ascii?Q?oKV3xk+wcodcZ9mNR8HlX6EhtvQ2tAlvhJcguavhaW0xRK4otTjL2YbUKUZF?=
 =?us-ascii?Q?tsTqzTUKzRrKPeFAFXefq+ERK5kQEetI1qUuROMP4OGs4OXtm0/hjBYFOBd/?=
 =?us-ascii?Q?dQLUI7Wj8r/qv8HJk+asm5gykZP/DNuU7p0lu8YM/dV7DSSE+FgArrk4kSl1?=
 =?us-ascii?Q?KD1WQbN9P1MM3bn533XVNCIQroigeBki3k3Fi6r5mtjnruHJHeQRAAlYhupc?=
 =?us-ascii?Q?lKxa/aQ0YamIcT8nCvHah9DQHiHETnYTarIFEbBMWu9S3Mwzil0QVUah7MNr?=
 =?us-ascii?Q?NfudBe6eGsZNg00C7nLbSBgmPRbBVxTAR/dp7XG1BY/Wq/EtZ+XAI7/ltCXh?=
 =?us-ascii?Q?0O22JmMwwMYN5i99gXSlIzVFkjYMDBXsvq+eMjfOcQxFAyjCIKFkcwzQpSq+?=
 =?us-ascii?Q?hIOiwAH+Ng2KTIJGNibgu/wSlCYuwHaZqgrnLf2ezLf+jw8EjIa/RQAjNp8t?=
 =?us-ascii?Q?aOV1TVWwv5oki2ey4JPf3JD+xc6zNUoHvKRpwyIOmy5Ws2+dt6w5vkbOWCWV?=
 =?us-ascii?Q?c9WpYrXppD1wE3s4Dat+o4vlD0/Dt6OzjHyi/8zieptxR7JD6IWV+LcLfbmu?=
 =?us-ascii?Q?fCvUc5Cj/AqlmpFMFDSq9XsAJrGYJfwOqKPMl88uUd+kpP3c0N6/0GsbuEF/?=
 =?us-ascii?Q?vIJLNF1ViUEePKNgce9aIGTmLJnNToWpvHgPKbJXs4Nu72ucngzbNU20ULnT?=
 =?us-ascii?Q?2FvFn2hhnUkn+xlnL9qXhH7XGd++GYYpeyAA+Hu+GtCgKqfjzQVEjVfp9UL7?=
 =?us-ascii?Q?z+ego+Qml2pCdT3Oie2abmUzSW5NFsBIszG3GLEFsA0IkD/R4Xa1MlvraHls?=
 =?us-ascii?Q?P//KGGxfjSx1+PN2Ro+mzbIft+TKGoCmGacGM2EB4wrc7IIRokD/cjYzXBUH?=
 =?us-ascii?Q?kbQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dpmel5rImKFnvo1IFWeK3g46yGjn6hUJUThfAgQRP+/UM651O6gdgge6Q/ih?=
 =?us-ascii?Q?NyPyIczHvidouoJ4mxrgJ89MYj3u8nQp5xdI2p+faJNEMiMONEezstCxrcjD?=
 =?us-ascii?Q?2Svpr3/BF6eMXi6cBq4Lbmx7InfHnLLdnPZ7D3FNkiOsDP23VddaMmiWNkIi?=
 =?us-ascii?Q?3yymyHO48OIn4F2m5eynEuxDfvaidlTiuXtSyQz+kognGkPJhGbS2LkMbhEj?=
 =?us-ascii?Q?ASe4MIrW4pG0xFejjUMiU+U/+IUb4qYSfwrm2JITd7EV10BuyPcOM+EdhQrN?=
 =?us-ascii?Q?R0jwYBg0VfW4SYjx3DsbXKcvPdTfEg8XEql2DosAsWuQDB95rN/MKp23sXZR?=
 =?us-ascii?Q?4IIp3j7arMIxydFZL5C4CDfphwjYYLbqGZsWqW23XvpQ5NGhYL0ccAsx5fyM?=
 =?us-ascii?Q?xUBtkmSFpYck6LwD1HwcBQSEEZbXAzKLTSFQ5/QfPxYhe00wQDHiGZHJJdst?=
 =?us-ascii?Q?FjpW/Sx4/C+BcvUaitQ+RaBjTSdvwybDzdY4xcY/I0rdxdMKA4qQ+cWQg2WW?=
 =?us-ascii?Q?kKZmJB+Uj0qajDZYBxftEy14Ak29QYrKR7awLvvrPeCVOdjhjQkxc6TId+jt?=
 =?us-ascii?Q?I4xzBBKjxR7Jgst7/RnNonp1KM0sW+Y2hIQngF0Ax7HKHAyVGPS0C4A6YU0W?=
 =?us-ascii?Q?3TjIU/tJgY4pGhGszRJsjVDhPpdP7bYLIgszPC7+RlJJx+AcbladZqVNfLvK?=
 =?us-ascii?Q?qFY3BlhbY2jGVG80wfsHRFTw9uC/AiOHZGsBFC1PZfxhMcapu6HFd7G9pq+y?=
 =?us-ascii?Q?nB21RvNUepcSH4j6K7DYFicn75O4Vo+Z23cLnCJO+/LQLfYS0rN9a6vCdGy1?=
 =?us-ascii?Q?FAXNIFuEvz89pj/fofveA7Du3Bc+pb2xNEpgKsTxlJJSvd3sYNyFNJ+H5R6K?=
 =?us-ascii?Q?CmEH5GlFZwV8WDmHH1tzqIjc4fIigCfYskf9VJk4zCSMMWRbdbITf9DXPzl0?=
 =?us-ascii?Q?5gAgrZK9TL0Ak5/HlekaNIK9KTVZDuFHtBJLeXlEPamyeFNPMPhvpOAPelTW?=
 =?us-ascii?Q?sIXjcBz6a1J1EXdUiRIraREygc8X+RztuQdZUNB+o0OblhVrGXffcBK/5Ab3?=
 =?us-ascii?Q?0SzY0W/1w3CcWvzOorIwvROIeYEuNH6Qh+9QyRHoN2XkwgDWz+mqEUREcJ/O?=
 =?us-ascii?Q?HxR1148mK2+QJRyEPVXKFJ54gW70PHExsNsAuLypHhN/+JxUu/UEl/yeB3dG?=
 =?us-ascii?Q?HhTwyM4a02afxDuXDNKW0Rz2r6Vc8Lsf3H/gCYK2ua/WrMjp6wisY0nSQryd?=
 =?us-ascii?Q?t6JXyXyKTgZSfYx7gKl6p/9YgAGP9DvOzVqUDkrXk1jNEF8EeF6m8osYZgFw?=
 =?us-ascii?Q?ldsOaisFQxlq7eyMk3QjPW43uDC4z5Ij5N2uA8pumXgSELK8Tu14Y4RBe1U+?=
 =?us-ascii?Q?3WRadP25NbpzPt599YDETqTxkF3Z3WkedFD/1Il6OWS1r7jxEdYKIr8e/X6r?=
 =?us-ascii?Q?3eVDffk0SwEKqLUcpe0jkZOy9uPadfyI+CfMhs7ImMruBagfT7/E4WfSG8kq?=
 =?us-ascii?Q?u0LF9Z82CMBVEkhxNSTeTNb5RRtoSwSJ8eX12ecUJlK+T/a8pBUX1UYTtkI7?=
 =?us-ascii?Q?wdTnsc3Yjf4oluIVRZ6W0Zi6hFpzogTNgqRFHTd7VeI4SHKL+ZK26x6yFf3j?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fVeYmDew/CjvhOUxwKb3SFm0khzsYSG1WLK9oN+eyYbFI/LR6/Kp20JrcUw0WVnURQShKUufgGa5v3FUlnNpmDze2d1MPHloHbTSDBWPEZ+JAwgDHsonslosdyPsZwtGA1dy8hmCUBj/lzXfONNPIlOxN4UAyQhho5/UQxMC0qMR7SkSn04UZi5Jr3gjgerE4ALY/fe0liA0/bX9OtrsakHsa4ew0MH/K9iSjmxVuJLsxhmf/u+kJq0RtJlg0Oi7y2owGvX4iaXkde4EeKgVpta7hqjViorq+IPu3xNnChoHFsBm9ersqZ++TQe+fqKR1lwze/jaVfzFBesUUpQLYNeiH0uCTBNfrIXOFBWxv8DcWp5EdKWgauDMTi2HiUX/WC1MOynUuoAjyJMqlKuypXKKu+pL7gdGx6zHPdaTI33XUPsx26SINvhDH5PbmdUrsFaK7CeLjncO8bKrh0QE7Ge4HXl8oUJxvxPWSol+1COTIIE2lKJERhnqcNPhFreiMqQEwtDLNeXVJvaI1iy7fDys7DQbcONzVs5QBUs1e8Uw/7o/ygSzVuaV6NtrhdravcVRZ6yb93DQ7ty9NHXj2qJpXQ9SECpN6oB6y8+jLh0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d92bcc-fdd8-4509-a167-08dcc0a6f743
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 23:30:52.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjnIArI9A1fIQkMLsfjLd7jjbG4U9GyDie+oluCqp8qrLYSf9/01ASARcU9XGknTo7oRzKe1Tvr8KkmIDTbcK2fYCfmSyHwYptBqIB97LBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4209
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190157
X-Proofpoint-ORIG-GUID: C2TxzEc8CH3jFj2s8YHpHTuwAYEyUKz4
X-Proofpoint-GUID: C2TxzEc8CH3jFj2s8YHpHTuwAYEyUKz4

If bpf_get_stack() can give us stacks with NULL pointers at the top, wouldn't
we need code to remove those (if they need to be removed) from the actual
stack() data also?  If they are left there, then I would argue that we should
also include them in the stackdepth count.

On Tue, Jun 04, 2024 at 02:00:02PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The return value from the BPF helper function bpf_get_stack()
> basically returns the size of the stack returned.  We use this
> value to report stack depth.
> 
> Some of the top frames can be NULL, however, leading to some
> inconsistencies between reported stacks and stack depths.
> 
> Add some code to reduce the stack depth if one or two top
> frames are NULL.
> 
> There is an existing test to check for this problem.  It will
> appear in a later patch since it has multiple problems.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  bpf/get_bvar.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index ea5dc6b1..a0c04f3a 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -67,7 +67,9 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
>  		uint32_t bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
>  		uint64_t flags;
>  		char *buf = dctx->mem + (uint64_t)(&STACK_OFF);
> -		uint64_t stacksize;
> +		int64_t stacksize;
> +		int64_t topslot;
> +		uint64_t *pcs = (uint64_t *)buf;
>  
>  		if (id == DIF_VAR_USTACKDEPTH)
>  			flags = BPF_F_USER_STACK;
> @@ -87,8 +89,19 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
>  		 * what we can retrieve.  But it's also possible that the
>  		 * buffer was exactly large enough.  So, leave it to the user
>  		 * to interpret the result.
> +		 *
> +		 * The helper function also sometimes returns some empty frames
> +		 * at the top.  Bump the depth down some so that the stack depth
> +		 * we report is consistent with the number of frames returned.
> +		 * Arguably, this should be fixed in the kernel, but we can
> +		 * work around the problem for now.
>  		 */
> -		return stacksize / sizeof(uint64_t);
> +		topslot = stacksize / sizeof(uint64_t) - 1;
> +		if (topslot >= 0 && topslot < (bufsiz / sizeof(uint64_t)) && pcs[topslot] == 0)
> +			topslot--;
> +		if (topslot >= 0 && topslot < (bufsiz / sizeof(uint64_t)) && pcs[topslot] == 0)
> +			topslot--;
> +		return topslot + 1;
>  	}
>  	case DIF_VAR_CALLER:
>  	case DIF_VAR_UCALLER: {
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
