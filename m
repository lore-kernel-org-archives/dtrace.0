Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C8923A994
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766085824; cv=fail; b=FWi9Ywf+pDYFcSpq5TYzDM8MDG8Yho4jiSQ5rhzHqN7Ak23GfS04WDw/pZsdruwF00jNYTqj20UohRj+7qDA6k8yBQn1TrwlvNcdOYARf1Ed4X9ZfzUTrYXjV4nFcXppihpMwNpfY7hq8BV0sq7IphU0eBndWQrN7qp4fy+/WJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766085824; c=relaxed/simple;
	bh=eymnol9VPPZpQXs7VA5E216DNr7WWmQdnolelJHkqAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BatTH1FGIvbECYWDcp7SrhN56t//U/zPU2iqnH7xGPNmuc2AdHM7UBN0ibmdNeumcspdEFc4QCqeM3GiO9n8TljKapA5YNwpH6l7W2r0xvcZASQvRhbbeDnTJI6wnTSB8dpvIf0rDAWdCxz2+FojKWJHXMUX/SudzZHPJNSBR/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ju0GdcwC; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Rd1UCh7S reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ju0GdcwC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Rd1UCh7S"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJNG0g2255576
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2Mub8xLI/6fCusQ3QhPAcIM/zD7x/k3NQNgT/kJ6Heg=; b=
	Ju0GdcwCQcCERWFtBBXTO+jE9K4J5Kxgm36jUcYPHoLlqyf1KPYZn6m/AZWYEqVg
	/W5O/39bC7baV0GSNd23zml+M4b6OvC9/NzGkvYcpXA9dDIyVCD6pTTvtoRwPc2P
	qeAnKmh52yBwIDW2TPwbpXHaPS7BA3DlCCDtkF4uSM+DKui3TUZLVBsoQS/3neZD
	y2f251VP5Vfz8DVM7/ZsyLBOS8ojAT0K3eXJUFUYsxLciPrgEZqQ8oOa28t/9eMn
	KT6XYpIRVkbVH0+2VIiRhuZ97YEyqhQ+cDOaaJYSt/mCZttT+lTnG2RFwdXLxXyY
	35HrhHmsGPGsgpJfcJi/Qg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b106cgcsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:23:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BII5me1024826
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:23:41 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkda6f3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:23:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfGzSOESZJGbexOtOE9RHeM3rFSQRmHkczstpyynIBj/1CnWop2he5YpnLhRYbXwoZoSF0s8vNqv47LCsS0dxmKOvhOOy9KTMailXa9XAWGy7Wbr4RHqaWrrhuJF2iX4wc5/xrRPHm10WIe68VjB4r+8/+g2Y/I0iljwuFY/nRlTZhtBDrnWv4aLvRkSKHzDbmseoeUN4npFTNIjGSmn7ghglu+znq2/ftQ7UyB/03mjcICq59UOUtYHYnn34XQ2eCjJrR5XBGAsqM+/W+Z61pnqaZOW8ci6cBZH85sgx1aXIz6zkvz10bi7htVJxKft6IyggtN6WNyj6HA/r9SBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKKh3IuAapPr+8czYkeu15Qg9MMueRKJcWzlaTZsGwU=;
 b=s3lqeUEw1Dk16HR/OjdkHBdYmMdP1vvUZMrZ//PTpg4rzHoM6Y99XGIbXizQ4tNg/Z6jvJ2XQUP5mwnrGy2A1b4SZe07IAhaMCqidok4tc5+uAD9sUvYmZL+tFOgY4kG8S1Olpj9AB22qMj2VWdmVXa46ckLO/+mtIrBtsHjWFN4976UZ1N5rrZSQJhZlmqype0z5HtT7chvgvt+i8HZ2delEi6ol1pDRPeIaEW49CF63TowKW+XcxTanpELtGhzPZedx4qsPUtN1RQSQYSAMI3KElF8WpcdMpSAGEqUABnmLoW09Q7eECXyeqGHXNlWD1v3UOBTpCkXs409TpIfDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKKh3IuAapPr+8czYkeu15Qg9MMueRKJcWzlaTZsGwU=;
 b=Rd1UCh7S43uu18tlKWYn69gmHZjfU5iG+6HaKnpgrrSH0WiEElGerD8aZUfMnkwtIJsHAq44EAcOTpiflmaYAaCgrVgiQ0dponPVu+tmVBaI7vf9KJ8MwjnmD72S4I/bNefW1ftqXN4sA9pa5unEiFzezVvQLoM0ZeFIjJnGEo8=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by MW5PR10MB5713.namprd10.prod.outlook.com (2603:10b6:303:19a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 19:23:37 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 19:23:37 +0000
Date: Thu, 18 Dec 2025 14:23:34 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/4] cg, providers: refactor clearing
 probe arguments
Message-ID: <aURUtpXjLYdmeQka@oracle.com>
References: <DS0PR10MB752211096F0B38B398CD019CC2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <a601f7a6-6df3-8519-0986-3ee50934410d@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a601f7a6-6df3-8519-0986-3ee50934410d@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|MW5PR10MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: bec2f709-379d-4b4a-a756-08de3e6af13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?R/rPxuQJ7wVIJvjtNNWwCT0B6MHTOAPuaQ7ODdc/Y/tW3c2Unvd4JpA1vN?=
 =?iso-8859-1?Q?9CeKPWGn6L40O1dG0Q+/PpPEReWQ51SEDclOXxdS8NbjWFt0ZXRykF92I+?=
 =?iso-8859-1?Q?eD1N2+fJ4ieuTf4pj5IPnfMzsBKYjl5QXOCXd4Hkup1CU/TJgL+rEQ41lq?=
 =?iso-8859-1?Q?Ju6Y/0W6wGq/BpBBjaSWVUHRBG0DWhLPPq5bR9W/WR+cHwEJj1Xku31hsl?=
 =?iso-8859-1?Q?6knjz9n/lFA/+GvIB5s8i9h7C3/tnaVoQsGEnMbp72A+lb/WRmDxQ4rVWu?=
 =?iso-8859-1?Q?P9lCWYaQcUwXRstyMyufBRyWLki8As/Z/0USBiPPtM++pcevLokVVAP8YL?=
 =?iso-8859-1?Q?56+ZJtFyrs0YmfnJ1lcLGJRSxqzbCHRSCFKSkFnX0whq/Y+tj8YEisE1UX?=
 =?iso-8859-1?Q?dlqR8B/hiWljWphXNOIRcspbrAicFBXuq0S4eyisqcur/19xeDUdvQaHrY?=
 =?iso-8859-1?Q?NjYNFa4IOW8Esm4EtQ2wVjVC3aa5ZSxmSUH2qMByd3yYbVNTK2C7ABfA/A?=
 =?iso-8859-1?Q?vvX4NIpCDfcO6+wtNr/tD+DF1YKMTTMCx2NLy++ey3h21kzQ0wuMfOqvJX?=
 =?iso-8859-1?Q?R8iRAIy6cSuZ6NPOQbF7Hy+2dNDoXkRZ1OsNBRgolo/nUgq645aVW4k+Ae?=
 =?iso-8859-1?Q?1IZXatr774b252h47uvKzrympYNd6XaSF73aFpL90AUMj3G/XN90RlbAXz?=
 =?iso-8859-1?Q?wtjjpPzQFvvADs+ZSyN4OGEj6tfJNcxu7GNOuhckFj+lPV5d83IMV2VO9N?=
 =?iso-8859-1?Q?XP9RcxojacyzFUh+5w/7VP+V/Vtfi760mY6Jap9C+nIHEY8V/DPhnbEwhP?=
 =?iso-8859-1?Q?env5IV0y2ehJ9MFjJEFuracbo4hw0MYt5D0J7yxqtChZCnDF4im8sIowKN?=
 =?iso-8859-1?Q?QgqGn9QZoJa+xDT3u1yXITCFCA8nmjJ2l+qFKPzk1HsLM1SpHQTBAQLC5G?=
 =?iso-8859-1?Q?5o73lHKWbYs1U/Wqxcvd1LdmrvrFNrx6gD5nNjQeytXkkjOMsy4CqRhHZ9?=
 =?iso-8859-1?Q?i57AUGj0HVNxFPYaySN4rohl2HuVKUo9way/yWqfF/KYxVmdya3hlc9hTE?=
 =?iso-8859-1?Q?sj4CeC2Fv2x0HMNbQNK0VZMIjkJfv4pIa/Sk6usEBR8r+EfsB43yo76p3o?=
 =?iso-8859-1?Q?UvRSp/zqZadu22ZaovyQ7n9Lm16d3A0kRUdw3Yh2VBZmxSVrPDjvn06iOc?=
 =?iso-8859-1?Q?yqaeUTZ3At7GptL5IK/ukrTiAW66TgcmrzYRpIv8xs4Hj4aItKi7BMYgow?=
 =?iso-8859-1?Q?h+He0mrKASaAkeTZzQ9RhQujgMRApsHPKD208SdHGnqlopzF23xmCev7ui?=
 =?iso-8859-1?Q?CByINybfyoj9uqfqdwPnNwT06eq4De45MIz8ZOV4mAHOOsUJ263uuJh0Rb?=
 =?iso-8859-1?Q?qFzfF5q6C0JvO9u73T9LSI9oBt+qn2SUdW2yCEfcJUNmAzIfQCwoTMI4Aw?=
 =?iso-8859-1?Q?0lSr8unVkoHlBAT2qAlxXbz8/cEsyXzixvQYnGvqz9mk1Sv+2jeMFa31iU?=
 =?iso-8859-1?Q?BzSu0HbazTMvDc6X+Wkrcx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?MJHeepJvzhcNKEgH7kbSO/VyKJyVs8qUhTEkA1g77BTXb8CFLqcgsneidc?=
 =?iso-8859-1?Q?b3pNt/vF5c57N+eUmxyGB5l/RfuGYZkh2ABRTbHgi6OHXk0LrajuW84GKC?=
 =?iso-8859-1?Q?NV7AQogDVtDFm24xpp+Nvt+wlGDg4nPkJs8UossHlNWo4jEpnMRiuLs/7Q?=
 =?iso-8859-1?Q?vnoJDBl+8AXFV1TCw3FJwErczdelCmIb/+Qthpg1Qhys1FGxqtAfiO5l2I?=
 =?iso-8859-1?Q?D0YBV3w2Ly6Y6eqdINTt87L9hiM2uJRBmHR21sJlyF0QLQXx91S/OYfkS9?=
 =?iso-8859-1?Q?+UyJNeIscUKna5uAu5JGrZmLiMB/ggD6Btu3TikNpERcJB4b2AV1u+i502?=
 =?iso-8859-1?Q?QeRrao6g4Is8+TNnJIRZX5HwX2pSkz9wgvhCUv3OBn75h4ZhG7byUUpUJr?=
 =?iso-8859-1?Q?H1GMJsPBm20JvR9lGtR56obNZ3IIJx8D0iYVe+8njmd7Gv55axsuBX7UCp?=
 =?iso-8859-1?Q?tIQ5uW67+1CUBlNLatR8oEzRUn3J4chrPpBfV1kC1e8fyewKR5mw2rQbjN?=
 =?iso-8859-1?Q?Yj2K/1/nsmF7ryki0V25XsMDuzx636YM7EVophdRcBBFQAHcrPWMd0jhmJ?=
 =?iso-8859-1?Q?HMGH+ZmorS+lwf7D0pEqCEe+JfsvbG+Oh+VnY9k35INTPSPbjvs/DwZ3KF?=
 =?iso-8859-1?Q?UBDMmA4uD96TK3pASP7utz+7lE7QbNu2hT21+jBjjhactq7uF5X9SW7Nvj?=
 =?iso-8859-1?Q?wFEQKjWZV+CMMhH4RR9mGzMmRcFBK8krqQ/qcANkrQjzMHCNw0txzSZZ57?=
 =?iso-8859-1?Q?VNwyl93sHVI4S9R/qMLQOHOLjyR01cF4K82pgvOkCBjMDz/J8qF5BvJ7Zo?=
 =?iso-8859-1?Q?vGik6cRid1PFakVTwrtehzUZqM2XUbkFXJBX52IZBDA5za89GjGrk6zNow?=
 =?iso-8859-1?Q?JSl31tx/SGePinTsoRrB+VQsV3Fo3L6qAcNZp5Jq3t3ywMTuZ5//ZYXyGe?=
 =?iso-8859-1?Q?5eFcIVV4z9EUavT6pBVZFdFJtDT4lWOJ/NtPFWhnQ0970QajeS5t3COb+A?=
 =?iso-8859-1?Q?lyMk6U7CAip6zfkr0w7l5rE0AFqdD02lNPMCVTRokzpP66cPftKSXm3WNL?=
 =?iso-8859-1?Q?1RyTWjCRThoc0ZyXo+KDFkGV3Vf9uWZyXDigIp5nj82vUeTe6GLOv8JS0K?=
 =?iso-8859-1?Q?8YmxgHksqeXuQYXEUlPeHzdxGfYc8HEJ1Tgytk1mhyENngJW/lAs8Hb93C?=
 =?iso-8859-1?Q?tacae0d4V1IRCXNtSrs/dTGYd0An5WZ2na7DlfMjldN9Wtq41FuGznqMei?=
 =?iso-8859-1?Q?vEJ/Mt0OiJyqHjxzXhNrc3YDas4EfKWpBGYo55PxWF2iKDpRskviESl/DF?=
 =?iso-8859-1?Q?ZMUiK/v/a5eB3CZpEyr85NARL5huejZDk59stoaExJ6P7n/7Oi0tgOvRSi?=
 =?iso-8859-1?Q?nfZplZiemj52znGa1xhokR/LKH0i8RPVH9CKAeEdYK9Fg+5f3hb3546KIE?=
 =?iso-8859-1?Q?HgyfRCjMhXqedg7UVDmrNIi9ctEaC6eV+xK2qM2xCzseHZo1PRol+wVho5?=
 =?iso-8859-1?Q?DbSBJKDbWaYVHS/KqGTLfRQj8uOZzUE/W1lI46KFXxU+QWHnc4HHvXQQPb?=
 =?iso-8859-1?Q?MyF5QDR3s7MbUvSFYvAnVVPqGA+K2YM0Vo6nx0USofUQ9yxtU8I4cm9QtK?=
 =?iso-8859-1?Q?roH0ll1aW83a1e7evGRkFD04QIegqbwWOobUPNaLYa+blwZuTgUEuE4A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VfdNQ5+Il5CCWuRP2L3S5m2+5YEhimbFXZShQ3+bsO+3B0XHWHzNh2YhUt4LEDiKbfpiOjtMI1GdexlCeImNws0NWdPI7kznOFZOi7sHWRaNOCgUX1fkFW+D7fPYfzYUK+rKR41HJh9MdP1lVMlGW43swy6DVSirujsnaL4DL7K3CKJcp3XaDauYopIt7AvOzNamWJBLQRmFzINOeiEKr/zAhspYtgjIXO0JwtYB+IwqilDhjsUDqHBf/Wlbo0edrb4wZ/ajrmzatR7UIVHjg4snT8Wzwp9ha8lqkRmNdQm9EoFt6U40K31lHSNj9OdRpW9eVYERCXBvpDQ7tldjZ9PfNLpkX1O3vNwoIf1JwAsqYSvYqHdHYZBYu7bTK0Wy/IvAVS00WYkyeG/boyqpNOEU9iwAMEC+qmKcTKa09AK5koV2uv6Gv+UtpBnLpRxLsNDz+QiA+O8Zrjj85dc7fiRwI0Yv1QVoOXWBggbRh9Bxv+EIY2YWuFe3yVWczq/fkDbpV0YN7csTvU7wS+UvogXdQjrcZcgPxYXeHk++cUC3uNHAvaZtmxPdYBVyRegMCXomFLxUmns1RjvLeGHIN4pelmFmHrKaYI3axhfZadk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec2f709-379d-4b4a-a756-08de3e6af13e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:23:36.9686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3oimyQ42YcxNk6FexD2rkBRN+TvfPO8/JMEfCE7NoidQNSMUHxzFM8Ah9Ql12k7Ibx/kmnu36D881tRYYdsEk7s6ks3OSwTJdwcLHQxQvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5713
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180159
X-Proofpoint-ORIG-GUID: 7xlpR7oMJdsdph5RjlZVOwppzHl3mC09
X-Proofpoint-GUID: 7xlpR7oMJdsdph5RjlZVOwppzHl3mC09
X-Authority-Analysis: v=2.4 cv=et/SD4pX c=1 sm=1 tr=0 ts=694454bd b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=QvSi3DsC8jWSD5_x75oA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2MCBTYWx0ZWRfX7WMPSCWWu8cN
 nh7xJAKVLcJdk+SbpePWfkMRzA2ATim/zX72wYnR6Fwh2q7pd8F0QWwxYzy+9FXVOKAQBor1Sim
 IhAZH3qwxFxiSMHyFXuao8hvBA6tLipJWyTSSIUwf4nFEpg2MwNOj8h69n/KCsg6RcOTWHCLrGz
 dEk+A5dddLqcNqM+/l2GZs/nVSMHGNHET4riV3Zxuz66uhXpLmGeUQHLPaux5Vz8oe8rsHF8lC6
 0h0ohSJLSb9fBA8QR3SlcxBI04NYOqvcBteuCVbZ2kOsmY8eGrsBmLB18up9/+zS5FoBAjtEA5I
 ie/S9CWAp1IfiJ+m2w0Vp5KrGELctJIt6F+CY6iTKAbH5s/yD9nYHryTHfLU5yHAX003h0tFx5y
 b88HMwS/PmATuv+Ad3RvpbOVjx0Kiw==

On Thu, Dec 18, 2025 at 02:12:01PM -0500, Eugene Loh wrote:
> Two things...
> 
> On 12/17/25 00:09, Kris Van Hees via DTrace-devel wrote:
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_cg.c           | 34 +++++++++++++++++++++++++++++++---
> >   libdtrace/dt_cg.h           |  1 +
> >   libdtrace/dt_prov_cpc.c     | 17 -----------------
> >   libdtrace/dt_prov_dtrace.c  |  8 ++------
> >   libdtrace/dt_prov_profile.c | 23 +----------------------
> >   libdtrace/dt_prov_syscall.c | 10 ++--------
> 
> Is there also another clean-up site in dt_prov_sdt.c in trampoline()?

Ah right, good catch.

> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > @@ -454,6 +454,32 @@ dt_cg_tramp_copy_regs(dt_pcb_t *pcb)
> >   	}
> >   }
> > +/*
> > + * Clear the content of the 'argv' member of the machine state, from the given
> > + * index (idx).
> > + *
> > + * The caller must ensure that %r7 contains the value set by the
> > + * dt_cg_tramp_prologue*() functions.
> > + */
> > +void
> > +dt_cg_tramp_clear_argv(dt_pcb_t *pcb, int idx)
> > +{
> > +	dt_irlist_t	*dlp = &pcb->pcb_ir;
> > +	int		i, argc = ARRAY_SIZE(((dt_mstate_t *)0)->argv);
> > +
> > +	if (idx >= argc)
> > +		return;
> > +
> > +	/*
> > +	 *	memset(&dctx->mst->argv[idx], 0, sizeof(dt_pt_regs);
> > +	 *				// stdw [%7 + DMST_ARG(idx)], 0
> > +	 *				// stdw [%7 + DMST_ARG(idx + 1)], 0
> > +	 *				//     (...)
> > +	 */
> 
> Actually, the code is clearer and more concise than the comment. Plus, the
> comment is wrong?  What's sizeof(dt_pt_regs) doing in there?  Just drop the
> "memset" comment block.  The two lines of code speak for themselves.

Good point.  Removing.

v2 on the way.

> > +	for (i = idx; i < argc; i++)
> > +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
> > +}
