Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A822E7373
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788087460; cv=fail; b=nsA+Fun1gfKmjNaUkxp5Dsh4YLCnSfZXOAsXA5AF8MFtqr26DLggBi+L27Aj023brz1sOeaSRV5CJl3eoGX7n8LYVI8n+veCUB7k02cJxuoe0Gs7ti5A3HKbiBdLthvdY48SNdHBQepJFWGv2PhJpGi5YLrzM74bEsQZMinVY78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788087460; c=relaxed/simple;
	bh=Q2ChF/QsU9Am3+KZxWCGPSsEo1MHh7yZB3Z7pG9DGHU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rXwl1H5XSZTVUBDYMJqCw/MSnnPpy7LkSXpUcK6IvB/BhFhIRt10U2HA0EviGXVKmW84QQVlbpelrz6+1GFoJsIR8+BGEVqnHd0Ma+SIq0JmBbDDOGigVBF1XS7jsajjmi4hrRrWtHUm7eAT5g8Oai2G7mv48G6qZMLmieiIOt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jVcD7gu8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CZC0t+LB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jVcD7gu8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CZC0t+LB"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9BSt82884777
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=d3YahmP8XHQbBlkS8aPu8uuJsjQZZJ/c4JIanrMk8jU=; b=
	jVcD7gu8+JTY0basArMaJi9FZSofAQOE4pM/6N7/ldrrYeGZrCgp12Jgtbt0y8+T
	itZxFmeP9EzsMYvLszC9Lk8y1PenQqWjZFRjdcOSgu+A9ca7fNziH5LTlrFbgl9q
	ZV78KAAOC/qhzhQrEWWFQ4GKzL7o0Z3DuzCeqvrg3KmvWgarv7Nls4BrxVhSBLEO
	g5dtyO9mR91LcJ3kaQ7hiyG5fqK4gA7plABP5ytby1vXJATFG4EW1d4P9rIfdGLX
	rf7hHG5/fTpw2Nvphk6McL84wpLj6yaZhxmFcXynwpr17KmFi26ZBSAIWd4fl37T
	iwLR+jkh7+LP1urWmUq99w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbp7298cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:57:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67UAt5w7036141
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:57:35 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013031.outbound.protection.outlook.com [40.93.196.31])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvbuxe2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:57:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2v6qvUep2c3IQp1DfGnA4u77Jx385RB5xBcKsWDo/13XzSrF6w+6V98xOU3T2pspG9eBjWAYYOCRc+fqk98+8Bj7pMO72JGbwj1g2aFerelDm9xQbHL5kKaQW2blTW+CfsMSrFPvVktKHHHq6lmCj62C8DwTAzv2lo/WKtuErCyNyvCAn3Glw3b9zxsfQ2LKGmMYEbTRAcYPlkci1pX9yR+8ny0Sak1Ofc/xZ5vZ7TIkMZcHx5mr/SNysNIn3YLZysZGCm7m1agl/VjRzmebATvolbg2XMWZw7hFMGmVnWPNdxNjnx1u6pZ1CIaxc4FBPrIyM5M8x5N2+rsQpz30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3YahmP8XHQbBlkS8aPu8uuJsjQZZJ/c4JIanrMk8jU=;
 b=B7lZKEibplEqiJ7lwSQ3PKT5OugUd9kQBWmwZ2lt10nJPumIubAsy7BaOr77GbDefAT4rklpT3I74uQE2gDrDfjbeeh5Kp65UhKd/nt7NipckM0T+Pz5BxPqSHqCam9lESJZpgEBfO1uwSron5wONBZ0A3CjLUh4Po/d1nq5k0MfgE2dCXZXXneIDh1KdYERpin8yDixYfsYaSKggBceuPahAit6UbiFSsP2LL6aTnovLEK9q+bx9wxveNCTtyhvSluEWKT1NsNKVlmTIA3LBcYsTvv1he6OM5I5Hpx3F9umz0UUahyXLnZEZUiKH2hdHPAfYAFqJvRlIMrOOUQBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3YahmP8XHQbBlkS8aPu8uuJsjQZZJ/c4JIanrMk8jU=;
 b=CZC0t+LBgLR0XRN+gb2VbPbjkoTse8OsOVoFo8fMPbCiqhe8tn0K8Jvxuvkx6N0H9asrtCNHLFVWfNnVJ5Q0FgQcsBTzKOQOzPSeqkgbgEcuD6xNNHPDibHhIsxCCKlZIn4lL6rVaEEw9JqqkI6J1EMRmE089RBJ0XwvmfnSTVc=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by CH3PR10MB7562.namprd10.prod.outlook.com (2603:10b6:610:167::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sun, 30 Aug
 2026 10:57:32 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%5]) with mapi id 15.21.0382.007; Sun, 30 Aug 2026
 10:57:31 +0000
Message-ID: <ae73594d-d148-4327-b156-080c186c1624@oracle.com>
Date: Sun, 30 Aug 2026 11:57:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 2/6] usdt_parser: harden DOF and note
 bounds checks
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <726680d8981034c50eca4b8a174a60ca@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <726680d8981034c50eca4b8a174a60ca@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DO0P289CA0009.QATP289.PROD.OUTLOOK.COM
 (2603:1096:790:20::17) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|CH3PR10MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 119c95d6-4354-40b5-64fc-08df06857d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|6133799003|18002099003|17002099007|22082099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	f/IBf9dm2rJQhmEpXKvSj6UIDUxwfbkLY7+klMHjO2PYq3JGLyEefKjzPZ3Dfe7T9YRXjbUgAWToawVuULE4kmCMt2EXudxUslgcFlvrq4MVC7W/8jCKy7VY0W9eb/x2WMDpYZDIKDGFJEo91Ysf1wXhsKjT9v4WxWxrcQicmVhiMNIVT5D4JpxrYX0Wtu4C+rG2Z72+/PqWvNFAshZVC2PLo+e5kEQmSMNr4Vt0LG3dj9pqxDPDzsMFjZCP9D0u9OuIngJzBpBpTTGSmhqv44sJIOUXsVKgXF47jJ8tY4JSt4uqPy7w59qjfOMsRYvuUoA0QpXTRBi+k+Jrow3NyALY4hGQs969ezx3wAIeruZLjgvFz1L4WwGgbp9akSHe2YdARIOq4Q5FoYwfTCTw3iYR0nVdUl808hTm+pJMOIDIG/Iks5DOgq4Uk+hwkT531ik4KU0/xUJlwr53LeZ45uPgZ/MlnZ9aWVF85DSu4wvaBQWlXvPo2AaC0gA8fICyOP+wd0HHI9YUWN5JDFpsqcavbDk7DbIhTmkXpo6nFPIPtDgnqfFZdQAvhiq/sPd8WibDSr19CDoBiD8eSuQwIpYZ+e3H6zuAmHFbcAAqIaaJppSEtHENBcDVetVWsqDaR/FEfX4+BmkhyvH65DksyBAoKJSzrxgvs2rZS+4ER9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(18002099003)(17002099007)(22082099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnA4TlVCaFc4NTNXQys0OEw4ZC9SY0FEM0hlR1pCRHFjQ1lFckJ3L3YvQ3F1?=
 =?utf-8?B?L1o1OE01OG8wb1NnVEpCMW5LOTZ6dVI0VGdJTXlYMlVpc3hVOTJZMncwUkxw?=
 =?utf-8?B?aVJSWWxUZTd4eHJwRFkwYWhta1VQejZleklyeEdpazVNOUNlcGl4c1dnUzUz?=
 =?utf-8?B?ZWJSUmlRMGw2N29XNHBrVU9GYlJFOFVtaHU5dStQeHJrSGoyWFdQSzVNQXRK?=
 =?utf-8?B?eEFmeDUxQS9pVTkvcjRmM2NzREJqbTZXcXdIS3RObEZneENwTVJ3UnFtRC9j?=
 =?utf-8?B?bWE3eUJLa0t2UnY4TVZRUjIyWWJyM0lySDR1eGxuVEp3b0I5R09xQXFSemtG?=
 =?utf-8?B?S1dvc0RudzlkME05aUZQZCtVQXpOTHhMWU1acGhpdHdqL1RaY21SSFZ2VHpO?=
 =?utf-8?B?ejlxKzRqOWIxc1Z6cE5nTUNsS0IwM2tMY1prODZlNVBIWGNpRW5FdXhacU10?=
 =?utf-8?B?QjFsRjkwVm41bVBVWFh0dGdJazNGWll0ZHY4a1lUSmRRd1ZoV01oUGVGVExz?=
 =?utf-8?B?SUhrR2wzb2xCZHZ4VytBbGZNRHlIVUs2V3VnR0pvQkFzdFQ3TnlLV2Yyczhl?=
 =?utf-8?B?bXJmMUt2UlpVNW1WSlhCUmsxdkhaeVJvMWdHbk5wakhQZThkYkVMNHA2ODlM?=
 =?utf-8?B?NnlXbUJ0RkUzVXViTWtjalJlR0hkMlo5TXFtaW1IWUViSWFNZjlDSHFtdXdm?=
 =?utf-8?B?WFBJdWt2UTJlZVRpa0h3UWlCMzdnV2g3MHlaOWdUN01PaTZpc21XN0tZNEwz?=
 =?utf-8?B?S3BWZmEwaWVqTkk3a3dBZ2p2UjI0RzBqKzA0cS9pKzZDcjlOaUVuYXZYQVF4?=
 =?utf-8?B?VHBKQTdmcFA0WTBqOUZNMHBkVUxWV1h0allLeTVkQ0RWNlMyRTNBUTllajFt?=
 =?utf-8?B?Q2NwMEp6WWpUaDZ4Q2ZobjdsZkk5QVhON0F5U3UxUURBbHF6ck1qN2JqL1dh?=
 =?utf-8?B?MitLZTgraEZJZTljUkNxcGJOWUpKekl6SFFXVlVUeUtVajllSENMbTl2aWF5?=
 =?utf-8?B?NW1xZlUwemlVL29rOUYrQjZJSkZqa09BM0RlZzFmS0hpY1BuQlVlUzVRRWQ2?=
 =?utf-8?B?eHUwalR2OHk0TVBVYXZCaGx6c0JKSzMwbVY2djN2UCs1Q3JMWHM0d0ZWYnZD?=
 =?utf-8?B?aDVzTHM0TTIrWXMwMzhrdHNKa2w5bG9nZ1FLRjk3YnlJUkdvakVSMjZSaXFy?=
 =?utf-8?B?UmU2K2dhWXlCZ09ER0ltTnlRQzJXbktTcGl4Qk1pZ3ZkcUcrUFFieFFVSUxk?=
 =?utf-8?B?VU5rOVF2diszQ2lIYXhYcmZ6cTRHcGhOcHJ6dDhOK3dydzR3K3BCWWh2NWY5?=
 =?utf-8?B?b3M0Nm5RSk40d2kvdHpqZWNheWloMGtFTVR3YkQveERnenR2UUlBbE54bXRO?=
 =?utf-8?B?RFcxWmI0V3NQeW1INlQ4bWFnU3NIR3hRUkhzVEpLTG15dUNTUDMyenNnVFFF?=
 =?utf-8?B?QUJURHcxMm5GQmZwdW00c3lpbXRGcXU2QldMSytOLzlPQkdvU1hxVmxBNWNR?=
 =?utf-8?B?WHhCMWZXZlZQcFVyS1NYTVk1RFhTUGYxOVFTK3pkTlZXb1Q0Z1gvdkFNdERp?=
 =?utf-8?B?RklSUjY4SU5UUnFhdXZVV1N0bXBJRUF2UE8yYW05eTJNc2sxbzdiaWRMZDY1?=
 =?utf-8?B?Qit2VkZZbnVQN08zY0Eydm40Mkd2aHh6bGRwcXJZSXVkUWxsQzdJSlk3VjJJ?=
 =?utf-8?B?eVRMMm8zaVY0VFE5eXAxazdBc3F5QXJaSVBOeG9rR3lLR0FUeGpMcmNIMEtr?=
 =?utf-8?B?cFUxcmdLMjB5bXF4aWRLRFNKZWRtWWFYT3JjZ2xLaUJUL3lJdmNUT3RHSW1k?=
 =?utf-8?B?V1hOalNQdjZ5dlpycFoxbWZsZ3YvSHRBNU1UR1YvM1RpT3VwWFMzR0xEM29P?=
 =?utf-8?B?bys1RVVhckE4NE5xNytuaTVncUtoRzRnMUhldDE4a3FwYUJVbFMxa3Bkcit2?=
 =?utf-8?B?WlV0aG51WG1zczRDNURVdTNxMFRuSC9YcVN5bmFQKzczOFY4ZlpvQnNUY0Ey?=
 =?utf-8?B?Q0VDVHVpVXh6alVHbVRmSEZqVk0zaTVKYjdHT1lUSWpJMGM0aHZjUFRpcmJ5?=
 =?utf-8?B?N2ZXT3JJMHYvclRubVNxRTB3MFZUb1BKS1JJQy8zMFltaEkwSFVQMFk1SlFL?=
 =?utf-8?B?bm9jZjBvcEtzQnYrdGl2dGVUbnJPeXRROXcrRCtNc3RIVzQ3WDkyaHpCTDhm?=
 =?utf-8?B?ODR0UTRpVC9QNTNxejBDdW9YOTlxYXVHUzBYQjgrS21pTTBOSEtSMG51Ykht?=
 =?utf-8?B?MTFhUWpwaXhFQm9mMWpIaFNlNGMzWUlJeFExR1BNNWQyTkorSkNXMXJtRWNz?=
 =?utf-8?B?VlY2T2xOeldOSjk1QzJMOHpRZ2RENStkb0NkaFpuSVRRVEJJNEM2Zz09?=
X-Exchange-RoutingPolicyChecked:
	hPqFjwTaIrW75eLOJqrOO2eaA2Ktdu+3dELWPfs49yYB/XASBsdRXxWjpU4fPmzrgtRuqfFUyU5LgZbGUP6M76cE9RsqhQDGKZDhfAzQ0OLNNFH7iUmahU5prepT/gF7cEUbwMNSoL7NTOrW8GAYxxDXsXcvY+FhsR+1wHryVhK1HMJhU1zBlH6atZDQlPh0Zn09WMqLMWi4GgLKqjkgQ3sTJNxrTw4kxwp3/12nyc801EIHHmNejwNtnsDh/ImuG9UjjH683xOFrtLzpbY1uquQrPPWWri06teXRHb8Lyc19wbgDWJ9N1yMZ1y2atj0kkPdUIXdcvtrhInC3mdjMw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XEmTkvSxsQGejXU8tnQgxvQj7JPRxIjDivoQKDGwYLCUA3nGRfyXz3C24R2xj/tJfjo62t3B6HhGI6T2rbbYbhts+rjZ1lqbWdUCTtLmPCWKgHPZimP2+s4larEtHs/G1vqDvfxLL6KS+ctH4grbR1t+CgYef41qZbKCwBzC9hr6SmMj3F5TfLTObWEiH88IX2pp7d4SMDpUEaC3k6sZln2vZQWXxPk+k809yckZACTaDk3OBll4Fl+aFbtzAYjy6A1yejFO9dYrF4azp8hALupYHSkPQaxM2nJcdLV4LeA4LCow0l1vo18ZxCXKTKCrbd3qma0NTDrCa60dE7LPn8NrKSGZHUTEMlSzyolZAm1Bxao0o5IO16bqE5W9yJQoGw7+54xgkoiSXPD9BeD5exTwU9UcBEFx/3mK3U6Tm/UcL3LQOfoV9uPaMqyqx2dnIeUjZ+VdgpBRdJQPWyvRP6axRmgX30G/FE+ylQ+AhLUXaXDycewPczoFhIMp1H2ioHY1vxhEAgQF1tFWNgO3BSDcC1gCrzzfGC3Y4P0jBm0eB00X3i2VIpa6UYtyOe5KSt1CNkSW9xkksnO/RW4oU3GH8yNP/OuUfnGuxJcrss4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119c95d6-4354-40b5-64fc-08df06857d83
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 10:57:31.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZes6Yu3HgJb/pJWZfortpqoArpXURMLGDWJo7sX9khiMt61vzmBWCu5vHNTxiGMGTpKGhj/aoCUQb8DVdawfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7562
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608300092
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA5MiBTYWx0ZWRfX/t/t8WCGTIdg
 gVzInQbL9zaUH3/VDqfuPndAXNfV02ZSNnD+a6db+S7E261O5hvvF09ajtfIq75ZqjOAeIhKken
 kD6jbJw+X7NGahLUBv8Ir8E4jjb6ifFGaBq3KCa952pEt2jblKBY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA5MiBTYWx0ZWRfX1dLdHv0pFCFW
 FNqMaST4XKLqsAzPxeHiEOf7afrmJiWXeBKtwimWg7Ot7Vj/PvQ9qM/mzmkvePwGO7nU9xd2sfO
 iNs1PtAJpBlkDN16vxZns3NxVxV5xBqU4b40t533YPhR2ft8WDQJec54FgEOvKrvxX1zmiLgIMp
 9lIrl1+EyNpUNzjEla3fafoXISF1OhHuGooUAjtVr+ybX912wEaqS7TZPC9hXobmGF55Mfzq2cd
 3ZMUacQxxzlq7WLYG4kqWu7EAk89g3GahXwrMrOLgD1Vb8QaPkPxHajmPcbNdC5cJrGFN4L9tpC
 DL/tPpZn84+tmaHqfDH34YJlHtQhhvkOKhJHVPVo1ZSTokdC7zs2UzJqAPAD+8KiaW/cM9fZdh6
 SE1M/tT3JSau76bANq6q/5scUza7+cVjM1hRQQrhu+1CW98rh450Yrriy3F7ayqal7hQ9cMUHor
 YCjHYXoAXra5uOpZr/g==
X-Authority-Analysis: v=2.4 cv=G7os1dk5 c=1 sm=1 tr=0 ts=6a940ca0 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8
 a=lzEJw8WHmUrRb6AwK8UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 0tEShIei4i_0ckVk24HpCROxqGfRkqnG
X-Proofpoint-ORIG-GUID: 0tEShIei4i_0ckVk24HpCROxqGfRkqnG

On 28/08/2026 20:09, Kris Van Hees via DTrace-devel wrote:
> Validate DOF section metadata before use, require ELF note strings to
> terminate within their declared payloads, and check parsed DOF record
> sizes before DTrace consumes them.  This keeps malformed parser input
> or stash data from driving out-of-bounds reads in either the parser or
> the host.
> 
> Orabug: 39352038
> Orabug: 39352051
> Orabug: 39351967
> CVE: CVE-2026-46831
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

LGTM,

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> ---
>  include/dtrace/pid.h          |   2 +-
>  libcommon/usdt_parser.h       |  10 ++-
>  libcommon/usdt_parser_dof.c   |  25 +++---
>  libcommon/usdt_parser_notes.c | 106 +++++++++++++++++++------
>  libdtrace/dt_pid.c            | 142 ++++++++++++++++++++++++++++++----
>  5 files changed, 233 insertions(+), 52 deletions(-)
> 
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 4a239b07..88f9366c 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -45,7 +45,7 @@ typedef struct pid_probespec {
>  	size_t pps_nargvlen;			/* (high estimate of) length of array */
>  	char *pps_xargv;			/* array of xlated args */
>  	size_t pps_xargvlen;			/* (high estimate of) length of array */
> -	int8_t *pps_argmap;			/* mapped arg indexes */
> +	uint8_t *pps_argmap;			/* mapped arg indexes */
>  	char *pps_sargv;			/* list of arg sources */
>  	int pps_flags;				/* flags */
>  
> diff --git a/libcommon/usdt_parser.h b/libcommon/usdt_parser.h
> index b11207d1..99fc3033 100644
> --- a/libcommon/usdt_parser.h
> +++ b/libcommon/usdt_parser.h
> @@ -136,7 +136,7 @@ typedef struct dof_parsed {
>  			 * Mapping from native arg index to xlated arg index.
>  			 * xargc in length.
>  			 */
> -			int8_t argmap[1];
> +			uint8_t argmap[1];
>  		} argmap;
>  
>  		struct dpi_tracepoint_info {
> @@ -171,6 +171,14 @@ typedef struct dof_parsed {
>  	};
>  } dof_parsed_t;
>  
> +#define DIT_PROVIDER_HEADSZ	offsetof(dof_parsed_t, provider.name)
> +#define DIT_PROBE_HEADSZ	offsetof(dof_parsed_t, probe.name)
> +#define DIT_TRACEPOINT_HEADSZ	offsetof(dof_parsed_t, tracepoint.args)
> +#define DIT_ERR_HEADSZ		offsetof(dof_parsed_t, err.err)
> +#define DIT_ARGS_NATIVE_HEADSZ	offsetof(dof_parsed_t, nargs.args)
> +#define DIT_ARGS_XLAT_HEADSZ	offsetof(dof_parsed_t, xargs.args)
> +#define DIT_ARGS_MAP_HEADSZ	offsetof(dof_parsed_t, argmap.argmap)
> +
>  /*
>   * Host-side: in usdt_parser_host.c.
>   * The host is the non-jailed process that talks to the jailed parser.
> diff --git a/libcommon/usdt_parser_dof.c b/libcommon/usdt_parser_dof.c
> index bc8e185a..e2166985 100644
> --- a/libcommon/usdt_parser_dof.c
> +++ b/libcommon/usdt_parser_dof.c
> @@ -275,8 +275,8 @@ dof_slurp(int out, dof_hdr_t *dof, uint64_t ubase)
>  		return -1;
>  	}
>  
> -	if (dof->dofh_secsize == 0) {
> -		usdt_error(out, EINVAL, "zero section header size");
> +	if (dof->dofh_secsize != sizeof(dof_sec_t)) {
> +		usdt_error(out, EINVAL, "incorrect section header size");
>  		return -1;
>  	}
>  
> @@ -462,7 +462,7 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
>  		return -1;
>  	}
>  
> -	if (prb_sec->dofs_entsize == 0 ||
> +	if (prb_sec->dofs_entsize < sizeof(dof_probe_t) ||
>  	    prb_sec->dofs_entsize > prb_sec->dofs_size) {
>  		usdt_error(out, EINVAL, "invalid entry size %x, max %lx",
>  			   prb_sec->dofs_entsize, prb_sec->dofs_size);
> @@ -615,11 +615,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
>  		typeidx = prb->dofpr_xargv;
>  		typestr = strtab + prb->dofpr_xargv;
>  		for (k = 0; k < prb->dofpr_xargc; k++) {
> -			if (arg[prb->dofpr_argidx + k] > prb->dofpr_nargc) {
> +			if (arg[prb->dofpr_argidx + k] >= prb->dofpr_nargc) {
>  				usdt_error(out, EINVAL, "bad native argument index "
>  					   "for arg %i: %i (max %i)", k,
>  					   arg[prb->dofpr_argidx + k],
> -					   prb->dofpr_nargc);
> +					   prb->dofpr_nargc - 1);
>  				return -1;
>  			}
>  
> @@ -748,7 +748,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  	 * flags.
>  	 */
>  
> -	msg_size = offsetof(dof_parsed_t, probe.name) +
> +	msg_size = DIT_PROBE_HEADSZ +
>  		   strlen(dhpb->dthpb_mod) + 1 +
>  		   strlen(dhpb->dthpb_func) + 1 +
>  		   strlen(dhpb->dthpb_name) + 1;
> @@ -786,7 +786,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  		size_t	nargs_size;
>  
>  		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
> -		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
> +		msg_size = DIT_ARGS_NATIVE_HEADSZ + nargs_size;
>  
>  		msg = malloc(msg_size);
>  		if (!msg)
> @@ -808,8 +808,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  
>  			xargs_size = strings_len(dhpb->dthpb_xtypes,
>  						 dhpb->dthpb_xargc);
> -			msg_size = offsetof(dof_parsed_t, xargs.args) +
> -				   xargs_size;
> +			msg_size = DIT_ARGS_XLAT_HEADSZ + xargs_size;
>  
>  			msg = malloc(msg_size);
>  			if (!msg)
> @@ -826,9 +825,8 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  
>  			/* Then the mapping table. */
>  
> -			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
> -			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
> -				   map_size;
> +			map_size = dhpb->dthpb_xargc * sizeof(uint8_t);
> +			msg_size = DIT_ARGS_MAP_HEADSZ + map_size;
>  
>  			msg = malloc(msg_size);
>  			if (!msg)
> @@ -922,8 +920,7 @@ emit_provider(int out, dof_helper_t *dhp,
>  	}
>  
>  	dhpb.dthpb_prov = strtab + prov->dofpv_name;
> -	provider_msg_size = offsetof(dof_parsed_t, provider.name) +
> -	    strlen(dhpb.dthpb_prov) + 1;
> +	provider_msg_size = DIT_PROVIDER_HEADSZ + strlen(dhpb.dthpb_prov) + 1;
>  
>  	provider_msg = malloc(provider_msg_size);
>  	if (!provider_msg) {
> diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
> index c98c9fb0..7742024e 100644
> --- a/libcommon/usdt_parser_notes.c
> +++ b/libcommon/usdt_parser_notes.c
> @@ -73,6 +73,10 @@ get_note(int out, usdt_data_t *data, ssize_t off, usdt_note_t *note)
>  	}
>  
>  	note->name = (char *)data->buf + off;
> +	if (memchr(note->name, '\0', sz) == NULL) {
> +		usdt_error(out, EINVAL, "Unterminated name");
> +		return -1;
> +	}
>  	off += ALIGN(sz, 4);
>  
>  	dt_dbg_usdt("ELF note '%s' (%d bytes)\n",
> @@ -272,6 +276,25 @@ static dt_htab_ops_t pmap_htab_ops = {
>          .next = (htab_next_fn)prb_next
>  };
>  
> +/*
> + * Return the length of string 'str' (excluding the terminating NUL, if it
> + * terminates before the supplied 'end', and -1 otherwise.
> + */
> +static ssize_t
> +cstrlen(const char *str, const char *end)
> +{
> +	const char	*p;
> +
> +	if (str >= end)
> +		return -1;
> +
> +	p = memchr(str, '\0', end - str);
> +	if (p == NULL)
> +		return -1;
> +
> +	return p - str;
> +}
> +
>  /*
>   * Return the cummulative string length of 'cnt' consecutive 0-terminated
>   * strings.  If skip > 0, it indicates how many extra bytes are to be skipped
> @@ -284,10 +307,12 @@ strarray_size(uint8_t cnt, const char *str, const char *end, size_t skip)
>  	const char	*p = str;
>  
>  	while (cnt-- > 0) {
> -		if (p >= end)
> +		ssize_t	len = cstrlen(p, end);
> +
> +		if (len < 0 || skip > (size_t)(end - (p + len + 1)))
>  			return -1;
>  
> -		p += strlen(p) + 1 + skip;
> +		p += len + 1 + skip;
>  	}
>  
>  	return p - str;
> @@ -298,14 +323,21 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  		usdt_note_t *note)
>  {
>  	const char	*p = note->desc;
> +	const char	*end = p + note->hdr->n_descsz;
>  	dt_provider_t	prvt, *pvp;
>  	const uint32_t	*vals;
>  	uint32_t	probec;
> +	ssize_t		len;
>  	int		i;
>  
> +	len = cstrlen(p, end);
> +	if (len == -1) {
> +		usdt_error(out, EINVAL, "Unterminated provider name");
> +		return -1;
> +	}
>  	prvt.name = p;
> -	p += ALIGN(strlen(p) + 1, 4);
> -	if (p + 6 * sizeof(uint32_t) - note->desc > note->hdr->n_descsz) {
> +	p += ALIGN(len + 1, 4);
> +	if (p + 6 * sizeof(uint32_t) > end) {
>  		usdt_error(out, EINVAL, "Incomplete note data");
>  		return -1;
>  	}
> @@ -342,13 +374,18 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  		ssize_t		len;
>  
>  		p = (const char *)ALIGN((uintptr_t)p, 4);
> +		len = cstrlen(p, end);
> +		if (len == -1) {
> +			usdt_error(out, EINVAL, "Unterminated probe name");
> +			return -1;
> +		}
>  		prbt.prv = pvp->name;
>  		prbt.mod = dhp->dofhp_mod;
>  		prbt.fun = NULL;
>  		prbt.prb = p;
>  		prbt.off = 0;
> -		p += strlen(p) + 1;
> -		if (p + 2 * sizeof(uint8_t) - note->desc > note->hdr->n_descsz) {
> +		p += len + 1;
> +		if (p + 2 * sizeof(uint8_t) > end) {
>  			usdt_error(out, EINVAL, "Incomplete note data");
>  			return -1;
>  		}
> @@ -374,8 +411,7 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  		prp->ntp = 0;
>  		prp->is_enabled = 0;
>  		prp->nargc = argc = *(uint8_t *)p++;
> -		len = strarray_size(argc, p, note->desc + note->hdr->n_descsz,
> -				    0);
> +		len = strarray_size(argc, p, end, 0);
>  		if (len == -1) {
>  			usdt_error(out, EINVAL, "Incomplete note data");
>  			return -1;
> @@ -384,7 +420,7 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  		prp->nargs = p;
>  
>  		p += len;
> -		if (p - note->desc > note->hdr->n_descsz) {
> +		if (p >= end) {
>  			usdt_error(out, EINVAL, "Incomplete note data");
>  			return -1;
>  		}
> @@ -411,6 +447,11 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  				q = stpcpy(q, p);
>  				q++;
>  				p += strlen(p) + 1;
> +				if (*(uint8_t *)p >= prp->nargc) {
> +					usdt_error(out, EINVAL,
> +						   "bad native argument index");
> +					return -1;
> +				}
>  				prp->xmap[j] = *p;
>  				p++;
>  			}
> @@ -432,7 +473,9 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  		usdt_note_t *note)
>  {
>  	const char	*p = note->desc;
> +	const char	*end = p + note->hdr->n_descsz;
>  	uint64_t	off, fno;
> +	ssize_t		len;
>  	dt_probe_t	prbt, *prp;
>  
>  	data = data->next;
> @@ -441,7 +484,7 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  		return -1;
>  	}
>  
> -	if (p + 2 * sizeof(uint64_t) - note->desc > note->hdr->n_descsz) {
> +	if (p + 2 * sizeof(uint64_t) >= end) {
>  		usdt_error(out, EINVAL, "Incomplete note data");
>  		return -1;
>  	}
> @@ -450,10 +493,15 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  	p += sizeof(uint64_t);
>  	fno = *(uint64_t *)p;
>  	p += sizeof(uint64_t);
> +	len = cstrlen(p, end);
> +	if (len == -1) {
> +		usdt_error(out, EINVAL, "Unterminated provider name");
> +		return -1;
> +	}
>  
>  	prbt.prv = p;
> -	p += strlen(p) + 1;
> -	if (p - note->desc > note->hdr->n_descsz) {
> +	p += len + 1;
> +	if (p >= end) {
>  		usdt_error(out, EINVAL, "Incomplete note data");
>  		return -1;
>  	}
> @@ -463,9 +511,18 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  		return -1;
>  	}
>  	prbt.fun = (char *)data->buf + fno;
> +	if (cstrlen(prbt.fun, (char *)data->buf + data->size) == -1) {
> +		usdt_error(out, EINVAL, "Unterminated function name");
> +		return -1;
> +	}
> +	len = cstrlen(p, end);
> +	if (len == -1) {
> +		usdt_error(out, EINVAL, "Unterminated probe name");
> +		return -1;
> +	}
>  	prbt.prb = p;
> -	p += strlen(p) + 1;
> -	if (p - note->desc > note->hdr->n_descsz) {
> +	p += len + 1;
> +	if (p >= end) {
>  		usdt_error(out, EINVAL, "Incomplete note data");
>  		return -1;
>  	}
> @@ -510,9 +567,14 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  	prp->is_enabled = (note->hdr->n_type == _USDT_EN_NOTE_TYPE ? 1 : 0);
>  	prp->ntp = 0;
>  	prp->sargc = *p++;
> +	len = cstrlen(p, end);
> +	if (len == -1) {
> +		usdt_error(out, EINVAL, "Unterminated argument string");
> +		return -1;
> +	}
>  	prp->sargs = p;
> -	p += strlen(p) + 1;
> -	if (p - note->desc > note->hdr->n_descsz) {
> +	p += len + 1;
> +	if (p > end) {
>  		usdt_error(out, EINVAL, "Incomplete note data");
>  		return -1;
>  	}
> @@ -537,22 +599,22 @@ alloc_msg(int out, dof_parsed_info_t type, size_t len)
>  
>  	switch (type) {
>  	case DIT_PROVIDER:
> -		len += offsetof(dof_parsed_t, provider.name);
> +		len += DIT_PROVIDER_HEADSZ;
>  		break;
>  	case DIT_PROBE:
> -		len += offsetof(dof_parsed_t, probe.name);
> +		len += DIT_PROBE_HEADSZ;
>  		break;
>  	case DIT_ARGS_NATIVE:
> -		len += offsetof(dof_parsed_t, nargs.args);
> +		len += DIT_ARGS_NATIVE_HEADSZ;
>  		break;
>  	case DIT_ARGS_XLAT:
> -		len += offsetof(dof_parsed_t, xargs.args);
> +		len += DIT_ARGS_XLAT_HEADSZ;
>  		break;
>  	case DIT_ARGS_MAP:
> -		len += offsetof(dof_parsed_t, argmap.argmap);
> +		len += DIT_ARGS_MAP_HEADSZ;
>  		break;
>  	case DIT_TRACEPOINT:
> -		len += offsetof(dof_parsed_t, tracepoint.args);
> +		len += DIT_TRACEPOINT_HEADSZ;
>  		break;
>  	default:
>  		usdt_error(out, EINVAL, "Unknown dof_parsed_t type: %d", type);
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 7e6e5d90..e20bc82b 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -782,25 +782,93 @@ err:
>  }
>  
>  /*
> - * A quick check that a parsed DOF record read hasn't incurred a buffer overrun
> - * and is of the type expected.
> + * Ensure that the buffer has enough data to read the record of the expected
> + * type.  Ensure that all records have at least 1 byte of payload data.
>   */
>  static int
>  validate_dof_record(const char *path, const dof_parsed_t *parsed,
> -		    dof_parsed_info_t expected, size_t buf_size,
> +		    dof_parsed_info_t type, size_t headsz, size_t buf_size,
>  		    size_t seen_size)
>  {
> -	if (buf_size < seen_size) {
> +	size_t	data_size;
> +
> +	/* If we have read more than there is, we must always fail. */
> +	if (buf_size < seen_size)
> +		data_size = 0;
> +	else
> +		data_size = buf_size - seen_size;
> +
> +	if (data_size < headsz || data_size < parsed->size) {
>  		dt_dprintf("DOF too small when adding probes (seen %zi bytes)\n",
>  			   seen_size);
>  		return 0;
>  	}
>  
> -	if (parsed->type != expected) {
> +	if (parsed->size < headsz + 1) {
> +		dt_dprintf("DOF record too small: expected %zi, got %zi\n",
> +			   headsz, parsed->size);
> +		return 0;
> +	}
> +
> +	if (parsed->type != type) {
>  		dt_dprintf("%s format invalid: expected %i, got %i\n", path,
> -			   expected, parsed->type);
> +			   type, parsed->type);
>  		return 0;
>  	}
> +
> +	return 1;
> +}
> +
> +/*
> + * Validate a payload containing CNT consecutive NUL-terminated strings.
> + */
> +static int
> +validate_string_payload(const char *path, const char *payload,
> +			size_t payload_size, size_t cnt)
> +{
> +	const char	*p = payload;
> +	const char	*end = payload + payload_size;
> +	size_t		i;
> +
> +	for (i = 0; i < cnt; i++) {
> +		const char	*nul;
> +
> +		if (p >= end) {
> +			dt_dprintf("%s string payload too small\n", path);
> +			return 0;
> +		}
> +
> +		nul = memchr(p, '\0', end - p);
> +		if (nul == NULL) {
> +			dt_dprintf("%s string payload unterminated\n", path);
> +			return 0;
> +		}
> +
> +		p = nul + 1;
> +	}
> +
> +	return 1;
> +}
> +
> +static int
> +validate_argmap_payload(const char *path, const uint8_t *argmap,
> +			size_t payload_size, size_t nargc, size_t xargc)
> +{
> +	size_t	i;
> +
> +	if (payload_size < xargc * sizeof(uint8_t)) {
> +		dt_dprintf("%s argmap payload too small\n", path);
> +		return 0;
> +	}
> +
> +	for (i = 0; i < xargc; i++) {
> +		if (argmap[i] >= nargc) {
> +			dt_dprintf("%s argmap entry %zi invalid: %u >= %zi\n",
> +				   path, i, argmap[i], nargc);
> +			return 0;
> +		}
> +	}
> +
>  	return 1;
>  }
>  
> @@ -908,13 +976,13 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>  		char *dof_buf = NULL, *p;
>  		struct stat s;
>  		char *path;
> -		size_t dof_buf_size, seen_size = 0;
> +		size_t dof_buf_size, seen_size = 0, payload_size;
>  		uint64_t *dof_version;
>  		char *prv, *mod, *fun, *prb;
>  		dof_parsed_t *provider, *probe;
>  		ssize_t nargvlen = 0, xargvlen = 0;
>  		char *nargv = NULL, *xargv = NULL;
> -		int8_t *argmap = NULL;
> +		uint8_t *argmap = NULL;
>  
>  		/*
>  		 * Regular files only: in particular, skip . and ..,
> @@ -929,7 +997,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>  			goto per_mapping_err;
>  
>  		dof_buf = read_file(path, &dof_buf_size);
> -		if (dof_buf == NULL)
> +		if (dof_buf == NULL || dof_buf_size < sizeof(uint64_t))
>  			goto per_mapping_err;
>  		dof_version = (uint64_t *) dof_buf;
>  		if (*dof_version != DOF_PARSED_VERSION) {
> @@ -945,27 +1013,50 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>  		 * probe.
>  		 */
>  		provider = (dof_parsed_t *) p;
> -		if (!validate_dof_record(path, provider, DIT_PROVIDER, dof_buf_size,
> +		if (!validate_dof_record(path, provider, DIT_PROVIDER,
> +					 DIT_PROVIDER_HEADSZ, dof_buf_size,
>  					 seen_size))
>  			goto parse_err;
>  
> +		/*
> +		 * Ensure that a validly terminated string follows the record
> +		 * header.
> +		 */
>  		prv = provider->provider.name;
> +		payload_size = provider->size - DIT_PROVIDER_HEADSZ;
> +		if (memchr(prv, '\0', payload_size) == NULL)
> +			goto parse_err;
>  
>  		p += provider->size;
>  		seen_size += provider->size;
>  
>  		probe = (dof_parsed_t *) p;
> -		if (!validate_dof_record(path, probe, DIT_PROBE, dof_buf_size,
> +		if (!validate_dof_record(path, probe, DIT_PROBE,
> +					 DIT_PROBE_HEADSZ, dof_buf_size,
>  					 seen_size))
>  			goto parse_err;
>  
>  		mod = probe->probe.name;
> +		payload_size = probe->size - DIT_PROBE_HEADSZ;
> +		if (memchr(mod, '\0', payload_size) == NULL)
> +			goto parse_err;
> +
>  		fun = mod + strlen(mod) + 1;
> +		payload_size -= strlen(mod) + 1;
> +		if (memchr(fun, '\0', payload_size) == NULL)
> +			goto parse_err;
>  		prb = fun + strlen(fun) + 1;
> +		payload_size -= strlen(fun) + 1;
> +		if (memchr(prb, '\0', payload_size) == NULL)
> +			goto parse_err;
>  
>  		p += probe->size;
>  		seen_size += probe->size;
>  
> +		if (probe->probe.nargc > UINT8_MAX ||
> +		    probe->probe.xargc > UINT8_MAX)
> +			goto parse_err;
> +
>  		/*
>  		 * Assume the order given in dof_parser.h, for simplicity.
>  		 */
> @@ -973,11 +1064,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>  			dof_parsed_t *args = (dof_parsed_t *) p;
>  
>  			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
> +						 DIT_ARGS_NATIVE_HEADSZ,
>  						 dof_buf_size, seen_size))
>  				goto parse_err;
>  
>  			nargv = args->nargs.args;
> -			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
> +			payload_size = args->size - DIT_ARGS_NATIVE_HEADSZ;
> +			if (!validate_string_payload(path, nargv, payload_size,
> +						     probe->probe.nargc))
> +				goto parse_err;
> +			nargvlen = payload_size;
>  			assert(nargvlen >= 0);
>  
>  			p += args->size;
> @@ -987,11 +1083,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>  			dof_parsed_t *args = (dof_parsed_t *) p;
>  
>  			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
> +						 DIT_ARGS_XLAT_HEADSZ,
>  						 dof_buf_size, seen_size))
>  				goto parse_err;
>  
>  			xargv = args->xargs.args;
> -			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
> +			payload_size = args->size - DIT_ARGS_XLAT_HEADSZ;
> +			if (!validate_string_payload(path, xargv, payload_size,
> +						     probe->probe.xargc))
> +				goto parse_err;
> +			xargvlen = payload_size;
>  			assert(xargvlen >= 0);
>  
>  			p += args->size;
> @@ -999,10 +1100,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>  			args = (dof_parsed_t *) p;
>  
>  			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
> +						 DIT_ARGS_MAP_HEADSZ,
>  						 dof_buf_size, seen_size))
>  				goto parse_err;
>  
>  			argmap = args->argmap.argmap;
> +			payload_size = args->size - DIT_ARGS_MAP_HEADSZ;
> +			if (!validate_argmap_payload(path, argmap, payload_size,
> +						     probe->probe.nargc,
> +						     probe->probe.xargc))
> +				goto parse_err;
>  
>  			p += args->size;
>  			seen_size += args->size;
> @@ -1017,6 +1124,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>  			const prmap_t *pmp;
>  
>  			if (!validate_dof_record(path, tp, DIT_TRACEPOINT,
> +						 DIT_TRACEPOINT_HEADSZ,
>  						 dof_buf_size, seen_size))
>  				goto parse_err;
>  
> @@ -1073,9 +1181,15 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>  			if (argmap)
>  				psp.pps_argmap = argmap;
>  
> -			if (tp->tracepoint.args[0] != 0)
> +			if (tp->tracepoint.args[0] != 0) {
>  				psp.pps_sargv = tp->tracepoint.args;
>  
> +				payload_size = tp->size - DIT_TRACEPOINT_HEADSZ;
> +				if (memchr(psp.pps_sargv, '\0',
> +					   payload_size) == NULL)
> +					goto parse_err;
> +			}
> +
>  			dt_dprintf("providing %s:%s:%s:%s for pid %d @ %lx\n",
>  				   psp.pps_prv, psp.pps_mod, psp.pps_fun,
>  				   psp.pps_prb, psp.pps_pid, psp.pps_off);
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

