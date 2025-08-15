Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AF918A6AE
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755269673; cv=fail; b=Cm4suK/z10bKT8N8hg7fXRbZOV/UnHdXg/NcXKsZeubNAREf1nyOhcoG+Z/KQU+ofZqhw9N4p9YlO4b78Z6TvGMGq8Yln8vDRs/SMpAkWGvFCe0gtwt1UXSVi1jhaeZD7XdVHC6M2Jxog29XSj8cuvxSEyB8WgguhMKITlzn6Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755269673; c=relaxed/simple;
	bh=HVutFeq/9cmZGAyOfQSdH/FtZ5V4fr7iRcLhrQbPVYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Md08/1KX0bkR6N5GH+s/bPPC9merp+8HaZmv2rINeDZ/KlDWw2D//ZcGWpktdbFELI+r3PdTTcISoM+0+b/03t3x6cbMa10qg9keVc0m17OlRNFReas6eRopQcU8tImk5mrN4t3HurCnsuxAIfolarQt6lzarnb6Oi8SfJNsNmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=q9dGkVXu; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BWArXg6h reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="q9dGkVXu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BWArXg6h"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FDN4C1014896
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 14:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=gz+/T6X+Q9NXy1FXEVXL5209jo3fDDkcyHP/3i5JDFI=; b=
	q9dGkVXuq9brM7Q99eKc3Tj8kfdvTV9taPY2BzW5d/MDgJzJ1vm1YngJd1B0kjv6
	ne9G1G3aVWJ5FgXimoDKfLlJn0Z3cPN5gNW1xQsUnyZs7k6ktyKXA3YesS5P3OGr
	6MPWb7seP4Bd5VV5f2V9ccI3bqPQNF0KvuHy5K4BGsrWR754wCBmShWHbY6kt972
	dDSBKa2OfWCH90B8R+myeJdt2fYSu6sAVmUox8VvjGeukX3HbziLJYObkqfHR2PW
	wBlCo6d3tZT1VL9Uykg4BJBtf6VgsjN1hmoUOQK+sTuXm4ZyedYBn5bw0DKjHZiA
	0uR73W6DQumzdfaocOmQ0A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4m3xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 14:54:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEA5o2017388
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 14:54:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvse20d7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 14:54:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekDzeZsGBYJCVx9AodyfcQf2Xwq+MDDlD+nBWedCYCzysgkb/XpRi9WB02BP87EB05aB6l+ypNHW+GmvzmqfQbGJ10KhxXF9SChrpyv14OUTvGzt/PPy+rt1MP3ZzNM+gmmK/7GouutYwy4bFMSTrhPer30Gz5Nh9CI6x1A2AD/MODu115kofyKNa+pTvC7Q38VWvK2eibwaDwOaPfKRhizHBfP9duNvkGwTlyG0B63smqm98Yva7JDQVC2+01ty1oD1b0j0K39qwZWviGXTmzlqwJcpv1fNfJDGKCEO/nY9e43TX/9BomdJuVtkoqquDknjVY9tV4UVXb5u1l1/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fecSQSu3TY6+LwmZ3OFyFUMQu1gFQDWknp5Ph0VZuZg=;
 b=clChfydW+PwW2Q4wC+CsCbtpkSAhLxgiOla04m3Ns4866LsA8N1w9DjqZh2+I5QnaaOW1kjo1HcnbpRUwlwPNJKvaLJm/etEk20IVnaLBrT71wS0trhprvZL7TNv2OxphqDst8PzjCgJZal2XTTdrlTedenAthM3py3FF3kr1HSOPdC7gzey3cuCZKj6RARnN7MkA2H/Cw2PifJFiesrzlf9h9LXI5xSSmYTlaUAP+QCssyC4J9Z/vQSsPnuGKEkdJO45qko/iRusWPwfN4mvn6mzOe606p8tFquBomMlmVm/SP8e0ocJMvbOQ2GZQenILlR+KJLV0Cz2oVqMDRPzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fecSQSu3TY6+LwmZ3OFyFUMQu1gFQDWknp5Ph0VZuZg=;
 b=BWArXg6h1vlEwd7d/1RjbTHdGZEMxXaj2wv787GqVEi/wFWXee1ljmmC8WPTU6/hZNMdZ97MP3yTZeqm5jWmeCQ/4QinWn2zkVwXbiyQIBhadxPRKn9UILFrmazUsjeXfDHXbIO0vZmZQcZNZq04K1BI9r9sARgQVlrSJ4IwTco=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8539.namprd10.prod.outlook.com (2603:10b6:208:580::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 14:54:25 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 14:54:25 +0000
Date: Fri, 15 Aug 2025 10:54:22 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] uprobe: do not call populate_args() for
 pid probes
Message-ID: <aJ9KHoji90H4UnPM@oracle.com>
References: <SJ0PR10MB56724556AE44FF193BB9207CC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <8e075b06-1d39-3d9c-3924-61e948827485@oracle.com>
 <aJ44jo+ogadLIWau@oracle.com>
 <98bd1948-8866-dba8-4342-af9ade275719@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98bd1948-8866-dba8-4342-af9ade275719@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 9684b75c-551b-4bcc-1732-08dddc0ba0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?O+rouIW4uq5iz3EpABQ6gbmWjL0SIBFEups0uMikri64dsF72XBrEIPvD1?=
 =?iso-8859-1?Q?33SUZ8xEWcn4IyPbchMfOU08x7YKhfORzfq3LcVCbQwJk0++efSMw/zaHV?=
 =?iso-8859-1?Q?e+Z0A5eSEF9MUDVNpevGRwXP12rQc2v4AXYaQA59FRvdqZBt2z5w4T4Hhj?=
 =?iso-8859-1?Q?YnJ2aBSAmqchIdrg0ho866s76p30UjS+7uQXQSJV5+O3mjyUvG095JXw9h?=
 =?iso-8859-1?Q?6gjwWYZxU0g8kjVc3UYRa+fOgexvQRXnfm1IieiZ556jHspDMENPl+WRxn?=
 =?iso-8859-1?Q?iGPyIItCSexzgJJ/VbfOGLx7uOoDb4kDyXfKGfn/b0tZPygSzn5aEk47fN?=
 =?iso-8859-1?Q?HujuD5y9aDCjwMzP3icaiakB8BKarsuDaigvJmXVmYtk224e2ZZjMamLHq?=
 =?iso-8859-1?Q?Kj+xz1I4yNaBfu4pMCTRd6HdtwPMgoFjDXCF6De6rA3kAY2xsINTVYNiHt?=
 =?iso-8859-1?Q?k8tyutCGr9qm88vn6w89foRL2CWH7pOTYpKERD+mxwX1PAAeKQsZLKHhau?=
 =?iso-8859-1?Q?4SDMNKTmLMtYiiX+lSapKLyZ6jqq1pGAOgelpSSwgNpUYwRSOaZDH3fbvU?=
 =?iso-8859-1?Q?MtYqqJSw15S06H1hkYTF93ShZqJkiakt1B74MrPMAaWUJV7W309zfPXvRg?=
 =?iso-8859-1?Q?dWWdKcd0lQAUQ9EwCVzPm5Yn37toX38YYDTQMbjHAxElIsaqYT/c8CeM/q?=
 =?iso-8859-1?Q?fagVKgm27xgCn+RSSLVTtweabx4X3zLmNVVBFz0b/Osuog96G6Vm/Zl5mT?=
 =?iso-8859-1?Q?3/kd8v5q6GMRWXrJVWBTNGTLNG+3gCEHgbd125lv4kqlPgL9DZhhwI/b/e?=
 =?iso-8859-1?Q?dqcG1r8nJG/xkYdfn/IyXq+1yWEgqE0xvb6Qb6PcK8Rz9T/0CVeVBaWWIK?=
 =?iso-8859-1?Q?ZB7H8fAz4vmiV9rhE8aUXNr1lzDfplgR4Z5TFoIPrBfRc+B+MYNEWeQ+v1?=
 =?iso-8859-1?Q?cbIarhQgftYNZruuX8f+edwOk53e68OMdsGAmUAUwpeP3uNpzU5rHvRVCN?=
 =?iso-8859-1?Q?9HhqDyZSgEyVPekhrlpeaiac/vUsWw1hR8d9tEapHZc1l7Q2MBSScsZTgi?=
 =?iso-8859-1?Q?tmN6neufUKjrkryw/LIyfRpTTC/ZLe/5HXizaDI8uWgDgEzTbPTkWu3+bR?=
 =?iso-8859-1?Q?6vDXs0fzOBg94SC/+PIex7uMBhhI1JmMRjR/oz2j5gR5sUDOQnHJbEo08w?=
 =?iso-8859-1?Q?jipY00a6K4IYCy8YgihE+dXBVWWCgr1LLlBNGyGgqFA1SJNsiRTZ5WHKsU?=
 =?iso-8859-1?Q?WMheSQBq3WUUjadUmB6t/r/eW6NnlcSxgSOcZDRnkhFLiHufN72Oj0FfZz?=
 =?iso-8859-1?Q?J18sq+5ERXswj3jKgGX2HvxpieOwi6ktHxq+lVpCklExZkvRCtSGUUIYZr?=
 =?iso-8859-1?Q?nZVDzgOtFFp9GWzbNDbD9R+7G9Q85+pTxxlUUdsqAXEuHIixlCgvYy2chJ?=
 =?iso-8859-1?Q?GLS97q6jGwPC7D85OxvcqtVcM+4ocRZhFldi2Uo80HkyO8+80eUlU9KGya?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?QHdWvtPPdtQE0wb9n8EZiGayfW+YQQL1UlreyjAbxnzdPkgBbAoUPGQJR6?=
 =?iso-8859-1?Q?sZzn0SjFBY17bOXR9zb64tEuS4h2LAGNF2al2yGFskHOOJGxQkaBS+bge6?=
 =?iso-8859-1?Q?P2MGXCziBxHYvYAm36SUmKKKgm2woSTwOXM5XpJmi9btYk7ypyiwxLnNBl?=
 =?iso-8859-1?Q?8Q5Xig5YRz3J9QEI4gCQvPAlbDNlnGEqj595G/7xieIcyyFHYEJGBriItF?=
 =?iso-8859-1?Q?8GJV0zibJnMmZvl7rdoeeGwfVg5vo0ysVauT4GB7fWGX6HHupQOPeEsVdE?=
 =?iso-8859-1?Q?URt3FPPgfn6mYLR4seI/AyWhomkNi25nCkltIUK8zUxUuhcfHFGBGo1dP2?=
 =?iso-8859-1?Q?7THfNL91rpfC13zso9h6m9+JM+rNFo16qt0sv/kiQuvFpC3We+/kBh8Y8C?=
 =?iso-8859-1?Q?gw2895TZb0Pn3M5hRm9t6w4Im8lNoCztL7UVSUOJjnfFF111LfYHKiYWmc?=
 =?iso-8859-1?Q?ULt4gPQ1Gyffeqic7nUSIDW+qNrGB5NhKmsLjuf0SoO2bVfm82FkAJRAwP?=
 =?iso-8859-1?Q?KUt/biTqyHzrLV9CDzgDP5UpiL6u5p3joWwk3VYWmvYt2oTv1iYM4NPBDX?=
 =?iso-8859-1?Q?U3VvLj+yctqYgy5zeVARSdKtSeUg4erGJOptRQg+jT614xbE9cAMdI/QWU?=
 =?iso-8859-1?Q?uqipJHLUlVHdeJB4TQr5B217SFY3H3pi4hIBFwTTskBfjUtFjh1u2ScKSz?=
 =?iso-8859-1?Q?1H70rHMXJnoBuDTxyV6Vjzf5zMojlT/QUuiXifsM4YSuss2/adl1hu+L5w?=
 =?iso-8859-1?Q?YSDz6JAGBhxbOooJ6dl6P64lOjUWJpoiv/Ht0MdR2vzOQWJjvQBAeRHgO/?=
 =?iso-8859-1?Q?fuZOTh2YTnkucCpMzzCbItrEq6xbhLwXj2aOIj5T9WGsGg6aE4eIPLw/tM?=
 =?iso-8859-1?Q?8LB2P0TqgWRzqpfdo3Yw0DDbhjVWl+r2+JuhxP0gL6eUlt8bEKm1xeFSv7?=
 =?iso-8859-1?Q?5z6+jOH9LO3Bi8NE+cwtsujFHNLY2JD/6ne3JmFR6n4VovqZbzUc1jmHTY?=
 =?iso-8859-1?Q?54faf7qEs0DxJQp6U5OvZ+jmCkktXvS5bw7E2HHxCo6brRv1uOmRv7UeVF?=
 =?iso-8859-1?Q?Ir/3S+j+uMCqB3UZcKyVF5zGLfIzakUVw1rBO0rnJ4J96jMvuUMHLsBjCj?=
 =?iso-8859-1?Q?FsoMieIMJCTTRIMvaqW6daZ671vlYSaBr5kBJc4/IA4QeynR/TITC38BVc?=
 =?iso-8859-1?Q?9NR4CHp1+R3JzFe2J5g8nhrCtmF0Ydk4SNwwT256N6ed26qblmdl/8lSmS?=
 =?iso-8859-1?Q?xnpLtQYJbhR7PbavK+tNQYimmdI16ruKEYTrjs23bybBwvWFI8y9YGj1od?=
 =?iso-8859-1?Q?dqP6+suRPRPidplpKF0KaHImIi4oz2z99NbRm2cY1FE4Egz8jQ5JGIpjlx?=
 =?iso-8859-1?Q?Fpy9EtDyr2qifDXXe7+b8iy2vSvB321zrU9ilOQJG1Gi7AtH2nBm2sijzt?=
 =?iso-8859-1?Q?+HrLrN3shINRvo/vs7cbzwxlrcofzMp8gLffK0zMna8WaDKMpVDHuquVod?=
 =?iso-8859-1?Q?DFfedfbJeMuOXfVvIjrABqPAcNFmrSvOtub+8ZKpE68T12XgA38n7zhqrl?=
 =?iso-8859-1?Q?EQKvhAVIm1RseVcveFgHcKWNXCajP56cDNTiemSGuTax8SvFRj6U0NrhD3?=
 =?iso-8859-1?Q?2fR1B8uVyadssPzNMKbZhOpIo20msN8ZPtZrGPG5HqZ5zjyao4jp3C/g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6Rd21cow/uAkspcGmJvpH5t6jTI2rG6RE0vbq+UiDxGnyv1Mp3ByddB98/kN+7KIqfPFjEK2qOjK7C4CYxFU81uev46WVa8/pjblSCLCZu8VVQ5Y3LyXStN97nlCa6A7QFZumRQlSwMKKOJXQodonu1kWmTaLVJtvdejom2ThH3QLYQMT42vlpzANgwZjTj0dMaz+b9gQIjGHIZOYWAQpGA+xLaDrP7PtGuM56ZiKxwl2KZGHn1BGdwpUtEGGTD3q84M9OCw4LydcbWEIJZV2wXgrH9Kg2fSyhYK0GzMLORnxEk9na6O3Ojgfq1LIdhIg6RACm6XN9qFyAlUU6nVbRsQ9UAlR0sCt+DKdmqFip2RVTP5TdQo3L9ZEc6hkTIwUJwK4dBVROtLid5jDfyQPQF1R4CfXprXnsA79k+meUMnWF2BU+1BT6mPvI38ai6fFDXewDstkZoAPPePeykksf8h8RQDcSwCHtsYrxBNm9lVue2OWOfURti5b8abZY31RosAdf9ZxkcUWsTTj8Fp34uJ8cGAd14FbPz7Z7x+IIN8atoek9zrIJwapusD5uUuVBSBHAsHGxxCqWGtI/ZHyO500VLQNEijLm7kqffDIDI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9684b75c-551b-4bcc-1732-08dddc0ba0bd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 14:54:25.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSGzqTQy3cMTBLzmDEk9B+A86QjddkYTCFZeitRPoL+Fkjo+pX55j7hhgEJ/ahm+DHwbsaimmsIGsUmapMxi/SiIMbr0SYsavQ9OfdLLdOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508150123
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE1MDEyMyBTYWx0ZWRfX2m8wCALh/3yS
 kriA9nadklhG0ipph2+0JpqYV2g6d+/VpM3DGssySFu9SIb2Qm3JcdPz4Ki50ScB7xrUPSsdGQK
 PgBvihJQT/xhDjM/9JInZlhQuxtu0XuH4COb6HzrPmYrwgdzcwRg4alBVauNqG9sph1cEc/k11l
 gN0GfFfYIp5QDT5gIjgY8aYaugHCdxaoMKttC41v4h88HXKrSgrw0QcQnvyKy5kx3G+BXPc1sCg
 QksE3HmKUQXIXuT+c1MB2RIeZs3Nbzuf55M/rFB796G8kI568DtTvHomaeqO38jIOJOhk45SWWh
 PPzgrF25H3zfR4F8/4zxcY+bO6xN+w4ANlhI5cXVBI+V5nVawWovMOP2+eQ5WT68JHbGJ3eXWui
 jwudpZLKHa5+XQF9PEKRwEZaJcu4ZhKS3xceQjOBktb3efOl06FxwPUUNmNUIWChdmOguP3I
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689f4a26 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=eqBsig7RZV8nOSUclBwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: DO2AbN_bbfeu8l0a-H-ptZ2Rm8kE9-sj
X-Proofpoint-ORIG-GUID: DO2AbN_bbfeu8l0a-H-ptZ2Rm8kE9-sj

On Fri, Aug 15, 2025 at 02:13:33AM -0400, Eugene Loh wrote:
> On 8/14/25 15:27, Kris Van Hees wrote:
> 
> > On Thu, Aug 14, 2025 at 12:47:25PM -0400, Eugene Loh wrote:
> > > Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > FWIW, with every patch I wonder:  "Are there any test issues?" (Like, should
> > > we test something here?  Were we?  Etc.)  I assume in this particular case,
> > > problems were revealed by patch "Fix various memory leaks related to stapsdt
> > > and usdt probes" on tests
> > >      test/unittest/usdt/tst.pidargmap.sh
> > >      test/unittest/usdt/tst.pidargs.sh
> > >      test/unittest/usdt/tst.pidprobes.sh
> > > The present patch is simply to remediate those revealed problems. To me,
> > > that sort of information is useful in a commit message.
> > I can add that in the future, though personally I don't find that as valuable
> > because anyone would have run a test prior to this patch and after the patch,
> > would notice that anyway.
> > 
> > But if it makes it easier to assess a patch, etc then I can add that in the
> > future.
> 
> Cool, yes.  A person might run the full test suite before and after, but
> they might not.  Anyhow, it does make it easier to review the patch.
> 
> But the reason for this email is that I seem to be getting
>         test/unittest/usdt/tst.stapsdt-notes-args.sh: FAIL: expected results
> differ.
>         test/unittest/usdt/tst.stapsdt-notes-isenabled.sh: FAIL: expected
> results differ.
>         test/unittest/usdt/tst.stapsdt-notes-lib.sh: FAIL: expected results
> differ.
>         test/unittest/usdt/tst.stapsdt-notes.sh: FAIL: expected results
> differ.
> with this patch.

Oops - not sure how that passed on my system when testing.  Either way,
posting fix in a sec.
> 
> > > On 8/13/25 23:58, Kris Van Hees via DTrace-devel wrote:
> > > > Only USDT (regular and is-enabled) probes need populate_args().
> > > > 
> > > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > > ---
> > > >    libdtrace/dt_prov_uprobe.c | 6 ++++--
> > > >    1 file changed, 4 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > > > index c63d58383..605ae8397 100644
> > > > --- a/libdtrace/dt_prov_uprobe.c
> > > > +++ b/libdtrace/dt_prov_uprobe.c
> > > > @@ -994,8 +994,10 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
> > > >    		 */
> > > >    	}
> > > > -	if (populate_args(dtp, psp, upp) < 0)
> > > > -		goto fail;
> > > > +	if (upp->flags & (PP_IS_ENABLED | PP_IS_USDT)) {
> > > > +		if (populate_args(dtp, psp, upp) < 0)
> > > > +			goto fail;
> > > > +	}
> > > >    	return uprp;
