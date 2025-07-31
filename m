Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4A2208CA
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753978440; cv=fail; b=SxwhrGkaBm0Y7c4KeqsZRkllN87KYmqLczeZ9e0bD3tNERlANA37gktCjLXYTilpfbyiN+lSa07lZHoiw37uJoEvFnCgt1b/ConxHJ+hV4Wk7KaQwUmQPOfRn2Pt0Yl/kOsWnkZnHWl/UfeSEUXIokQMNcTI3H4prHthDqNN8Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753978440; c=relaxed/simple;
	bh=pj5y548Gdisy+2wSt1lHcCmsglForO28xOgEcHvGKQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f+vr3BBimUDzWKzVNarbolKSaWeOE7mPu0hMZi2f41fahoQQchOQBvMNxDCEoEObM23ux/7jMulgQjh1zmBuHSRQw4Ar6cTCHg4R7k7qjixn5CHvXYSnedlCX+hkoOSZ3rGlHoTyp8GhY/GPgeMTTZP59luxRvArKOODjAkzRxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TeitUzxz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TlvnZ4p8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TeitUzxz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TlvnZ4p8"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VEu7S7018310
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 16:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TjoHzsrHNf/ignhHYT
	ZsRX63wVKSqF0JsRd2l3QmXVU=; b=TeitUzxzPqePRlSIr9pNnRp9xAL0UncWQx
	bcPLxngqrTP1HTpBINK9puGd4n/b7aScqnTkv2/w4tH0dZKyuNn6i0ucOQQH4gWj
	I4fvu243XC1PI+jMOA2B360rsJ0RW20dMebKs/jL6WWFcJ2l79YOEw4ZgFCP0f7R
	u3cr0pBfU7t8mPWgm3slF4gFz5w2yYUoD5e1V1NmPXW8ScFDrIio7qddKz0bwaIi
	tOCcR0tHQpOYLpsYX+uEDECB3kF/nnIuTwTrFIsI3Zdj8bsTqdjbZXGY5XsDGw1u
	QaiW2RVCq73JrHmSdtn6tl4GwgtlO/BbTDDm4k7VQVGa3wpnrdsQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q2e4qbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 16:13:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56VEl3Yg003097
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 16:13:56 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010066.outbound.protection.outlook.com [52.101.193.66])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfcpjr7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 16:13:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieJfmyi1ei2B2ce0FrnJkvVVmLpzC/NI685B6JDNQ/rl7k/dgKjGiy6GcIloj8FXcbarCjZMJlO6G+q7kGgchJLppHxzvCq3+rQj6vBEudSxzW5yT9TZYHshqGYsPZ62UL6IgtOtAsE3AFAZiaMgARdMhLL1P1eT6hcRd3laZWP6CcT2ysvymYUGcJmRh540Q46fsZmdU+/GrXfanHKS33CSF8AkE+7PcupZ72sC4h/N8oKp6Z0sMx6qTiLTXCtebU2Dgl40+nQrM7ES4jReaeNpkYfI11asWEx8AuP7utQsJi9n2GSuhHsUc16oqnxt7IkC45+M8iS1kL7jO23fsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjoHzsrHNf/ignhHYTZsRX63wVKSqF0JsRd2l3QmXVU=;
 b=xmqrJGGJCy8b0W+3tt28ofNcgAU5WrejSBT/eKMA5zd6TuYn01e+osIpVIScRE92uvjHKRljxoTlzwVxdCFgPDHhsXOHElE28+SaI6Jeh0jvsqjIIa3dNX8XYB1YBp9sZCJmKoPreHQIiEalJ1DdansGylHTqXpx3cu0k6nEwyU7DLUAk0bEpuWSkHoFPAwgiOW0Uupyy2F7PftBVaHNoGBgY4pWc9UwTrJf3x+Dcb+RZQQgIfkVYUCwWgte+wvgjcbI5RA8mmZyq27ji5h3KTSkTL4zUwWFPr349Y2DUOgcuC0kJbuy/YFEgw0GEmXN38XnH4h386lZYN4K4qZtSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjoHzsrHNf/ignhHYTZsRX63wVKSqF0JsRd2l3QmXVU=;
 b=TlvnZ4p8rlIIQhDnQ0PE845tuwPMBrXum+fuWRkoS16mn9ehpzyBdPQYEMRop2D5iuFMx6ubLa9fZ6DZ+FWqrI7gC5EUtrXso8PEW54WmcZb7pASljocOA7xI2MGNJZJuKBj+5eeLuy5hP9aq75sYRdqwVLh6VlQWGsJ6uojlxc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BY5PR10MB4115.namprd10.prod.outlook.com (2603:10b6:a03:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Thu, 31 Jul
 2025 16:13:52 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 16:13:52 +0000
Date: Thu, 31 Jul 2025 12:13:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: eugene.loh@oracle.com, dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 1.5/3] Remove unused map-of-maps functions
Message-ID: <aIuWPHzoQ0hvpz3Y@oracle.com>
References: <20250501183759.27917-1-eugene.loh@oracle.com>
 <87ikjsmei7.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikjsmei7.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BY5PR10MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: 232b3d15-d760-4b9f-0b12-08ddd04d3d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IwFpQl1N5zif3g5dSyWsfLdm0yBzfpA48kJqoOiGHcGUvS9WagrPZdI0v8T9?=
 =?us-ascii?Q?lXkQNH3B4jSBjetF/6+gDFLIporVBJWQuE25RM2Rghv62UQ0pJWQabbdERbL?=
 =?us-ascii?Q?Z0OnbRgMWXrHtts4ThUEG0ez1UDnSwOEKgDD1sC8++BulC0CLgglyYztgP2F?=
 =?us-ascii?Q?QCxmHdVy9iVLpxVNyiKhYxxqtT8wEaqtIG0EgH1y16+DUEb/cVJK+PYB9LKq?=
 =?us-ascii?Q?ORxIV5PbxgMsxag6k/FrzQTPr9PwdvaUDARIuh3IsfT1CYY7ufjAa4LmoXH3?=
 =?us-ascii?Q?47RFCfVL/w0QdthrQ7ewFuGDkRatBimTcN0UYR0TkRGH1JwR1flHcfLulg7B?=
 =?us-ascii?Q?MfWD/3Vx6TiSRVePYqmYP1HTBcdSWnRPPKvYLK2EoBQv0LKxumPTcDfvdHCg?=
 =?us-ascii?Q?GbY0yb7+rgctfmXd6BcHHdfv57rXxUvthfNeLifAqN+S3OfiPPMHo5mv2Ato?=
 =?us-ascii?Q?ztLURnjT9G4bX3FjeiVU5XEEmEgR+9YtCYqmKSxoBn5T3Ow78Fj2DBMaQ7W7?=
 =?us-ascii?Q?xqg8F+2j2Kl7ueM/4a9N2zh0m0nkMRrUoxP01rvgxPj2iloiFK5q4evtZB6i?=
 =?us-ascii?Q?cpTJFj+ycxZbVA7qQskFDQbZPXhdFZiMFRTmcC64BjfRpHsyZgzDoHGkQeTV?=
 =?us-ascii?Q?HhVA31b5X+Okmn9NsIkofkGrOsvLLi+/otyK3UDMolpE3FCwUAOywkVOQu9c?=
 =?us-ascii?Q?LjGtLN0W2hvXFDzG15Gjo8e0y24fN41ZOj0RdbCrtHZ97+DF/NRSuuHXmhTC?=
 =?us-ascii?Q?61r7r2+N2NGczY40d5zMvWyTnsBxNCbm+4jVpU8tcgw0Wd37pdGCzr98u2Lq?=
 =?us-ascii?Q?GIMVGS0YCPr/zsgutEpcM0Kp8Lokm6rUYKV3ivDiS2Xk1fQiTpboOf/vg+lz?=
 =?us-ascii?Q?eeyXlbX/TxKRHvGultLjAGZjbXnqY7Pz1e0KcS6ZerFH7hwDai7VDffd3Vv2?=
 =?us-ascii?Q?MVLA38G9VIz8/UKgYZlANlsNpOsCbpDQq4QHSbD91x6t02AwDv8wI9LDw0oN?=
 =?us-ascii?Q?VhOo46USmLWAMKrENIBb0Guydr0s/36U9cZVGNU+G/MWNpJxCGlBMFtYmKdg?=
 =?us-ascii?Q?Z68v8rrtMIvOa57arlq9ZhqRr6JIz4gdTUU+dBXpS6ZmlbH1rZ/Rq8jMmlYa?=
 =?us-ascii?Q?NJ1SIrUfYuLFSXMq7kMxRO0fj47Q6frnG7CQF9EtmiOkA7g3J+jxEL8T3nJT?=
 =?us-ascii?Q?GSCukTuZDEib+aooFfRaYAhMR1uoqs1LPm16TiMGIU+tdX9UJmCvIGKPzsP5?=
 =?us-ascii?Q?vcrV0Ea2Uyu3pa7+lEw2FaA4AFxHgZQxG+565aYjy8cP7kI5RBdL/6MT0VGk?=
 =?us-ascii?Q?95biKzKoUSN0NuirHw4QdTt03sFYg0Yu+kC867VTSK3MqqqYQQCGW9H1DaNv?=
 =?us-ascii?Q?MNJ2IlaYfdxb8xlWk9Scp9kr4dsQ0uBmsXTILz1XGDOhMtORoFTLK6MjoUD8?=
 =?us-ascii?Q?qn6/1xNEl5I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q/7x5mdguIeiGRjOTH70uBJlHKVaj9Cd6HASRBR6HkwG2ZPXrITcI3Nfjdk0?=
 =?us-ascii?Q?w66KybsXnvVBbenCYfsuYsa5u5WC8YijyXToLqbu4XxO6Q2Cln3mO9bpNxWS?=
 =?us-ascii?Q?ee/3E1iBb5UeqQCA9VQg8YdvfFJwTvYCinvcYr88WaAh/9JebZWqfdbnCUre?=
 =?us-ascii?Q?B2zR40lfBINTZei2feDR3QDYGb5OmW8LmSmcQjHnWH88N0wE1bhiQGqnb76B?=
 =?us-ascii?Q?sc7rk78Oz0CHKwIO1Itf3suvltBtYjrSaKWszU2HkKbaTtlUhzR1ZiDLld8O?=
 =?us-ascii?Q?Fvr9X7/CyUL3VuceS/FwIyLEhHTWe6JeD+PjxcmF/oRvcXwsby1G/LWZ56Na?=
 =?us-ascii?Q?NG6jJs9J3wv+qBRqe4Qtn9cw+zLRJVdQj6vHNNKCJqD5M49h4IQEAb343+G0?=
 =?us-ascii?Q?Xq0odWlBNWPkBFtQGzqYRmlqV6BzcIxFvihzBLG1wCrxEvfU0Dcb/lPqzBEM?=
 =?us-ascii?Q?QXHDWXS5lCGjo0s7OaP1XNK0AC+VquKLyUlCNeVY7gDPoAw7jmAGBUVG8MvB?=
 =?us-ascii?Q?2wB4bwF6p7J9fq8XsuXyRNIQlx98ZccSl69z2D1MEL4aMkeM7zFIvAeSb/73?=
 =?us-ascii?Q?YR7geI+uwPoGn32tVVIG/tbR9KsW/uuxaBTCRlAQX4ULD9Ve/MIErOfsx8Ft?=
 =?us-ascii?Q?t5lrgzdunYWyahZ04lorg7C/DtEYBJj69yjz62or2XnbfNwhhhvdle3AZC57?=
 =?us-ascii?Q?obCTkRDDiSHFpWjG3KkgIXpnNHtaGpVBYS/n0NrnIO3lnWUMqFAVa7E7WNxe?=
 =?us-ascii?Q?JCFfOAzjx4wMLxZisG1x0pdrnpQfVXoWvGJvvWp60ZdCLsF4xJPFic6Bjv+x?=
 =?us-ascii?Q?JeuFFTuZEzC3GRt1odtVq/LQC/1U+2SaX44zDUgR2/DOy6xnK0JJp+icOBly?=
 =?us-ascii?Q?aqByzlOzHiRXHfD6Uxptyo+aeQv90bNRpgu+vbvtmutMN8ZhU9mYgjAeWI2U?=
 =?us-ascii?Q?xZ+G7Fg/guAL3nN3LHZpPxXs2Vw09HoMviOfuMca4h9dKwaamrxs+wGRvHnd?=
 =?us-ascii?Q?sZiuWQsEl9x/SmfsZhY2ueXS6YHJzkY9uezyrP1vmxWN4DnYUNgy6/XdqBWg?=
 =?us-ascii?Q?UjvJQdNeAcoHnR8uXVTlgM7uk1YaK45+hP5FDkQj0ukaX07PjoIuLfwnIVPz?=
 =?us-ascii?Q?aPzPloiB+miulzktLGshcoAJM95BLDEXKGMjwTs7K7H5O6Uh+/EGAfuAjNVv?=
 =?us-ascii?Q?2m9QuO7OCqWFJirmfzd6k85W/Uy+UAUeJ/fm4EpOqOONC+bSKl58uGLY1FmW?=
 =?us-ascii?Q?nM2YSkE/AFws66DhaLEzA3Xn51Wmre1t+4yq3Nvqz58UuHs1mLzWIc5tWYzk?=
 =?us-ascii?Q?jiOQptsvonAuNGe7soFc66x6K3j4kjbuSeiEyjLFWSggoQ+Rc9XB8HHxSlNn?=
 =?us-ascii?Q?Pb/8EZJ6WfdHc/O049H916d+N2V1O7LKzhH6pFMV6eHUAtadEgZkprs/Q89B?=
 =?us-ascii?Q?d/jteIT5LT663X3IxrlW6R4sHw5pte1Sn+6YbvkyrHg6B4vLQk2HghPtEaBj?=
 =?us-ascii?Q?fmgJRqmTbE4KP5z/q+WKDYpNpsGweNOC2PEJBrsvEWkD7S3i4udut2KRc1zo?=
 =?us-ascii?Q?aMuVIWePhGe6J5PpK4VriQupWbLoc0fMhHwQmxip2TtrYAkBBP7Ws+GomMOx?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6MjyWO0YQhF+BKoetwXR9HT09G62oNgURqOhX6mzlzvbgecw9BHpq98t2tqlUUc1vJyWAc1PU67l1AXBjsOSRoHVoQKFUyTDUOR3fd/WbWW3drbDM0LGzpEP4LuDoqAYwnvIOKnS2WzWze3VK9S838p65X8sURQ7/33VKDGPjyhihvVzhZ3ABFQZl+NOyacFd0HU93jRb3rL82Y8mNgilTRh0qUI0ZnOP3B1N7cdyPclSOAOsA2k9ZI0GIg2lVZwKIq6xWn3ibtQVRwZdyFQ3/mFvVEPEc8LRTxlJmqYal8UQr/mfhKqqGWco072XbbgV10bpd65cqNSm0Pgc7BNjthW9q4GJZJBscqY12DUeUT87otNkJKmKJjLmyc6vKURdkq5KqA0gnQWA6jWgrrLNPtHR9p+HNWNRXCUbl29kjoVbfCrnzfNcMlXNyNciy87Hi6udPqo57OKOn9cdbIZbOYmCdWeEA+NilfZ9Ix4js/uM15Ve8fkhW/15UwgkFrOWhAJ801fKgEe+INtOrSI1kBKV20kaDI+FnHVCtT6mGQCtvxOd/zWaGl8nw3/CSPornjPEuVA30+8YMWXWbwA5ukUBbrie6Q5O974gBJ5lrg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232b3d15-d760-4b9f-0b12-08ddd04d3d5e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 16:13:51.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +19I6NJ9egyIvdjgmSqAUEakBdW0gyRp25TCrAY6kkkyrhTTc55DdQqnAd41bDgGIsaW4FKEojB06JDbd36neab0SG0hkvagoD2rRGjJccI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4115
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507310111
X-Proofpoint-GUID: 68GlciHmRAHe-9YPjOC9ic-oQ9iantSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDExMSBTYWx0ZWRfX7owEzBqcDbs/
 j/CorKngYvshxD0KhRuC3iAaC5iLJLvdtfVloHKh3VzJ6gi1yJIz5jb/GpYdfXZydmLgrOREbXY
 cO8LLpMni9x2KGhGPCBuiyChjsJHEzi45OU23UexZ/otXkIOI4e37rdT66dNS01COVtNfl4VKwH
 imD/R53q/Orddph8YtawNzU4qb96E5e2Hhv+ZG0byAwkwzJgYV105sHA0NrnGQLPskKdrSEDPlQ
 c6URfSOT2gF7c7l1dPi11MluaWyMZ31PKDKq4eRJWn9NZPk4gikrsyDDPSR0SDW70DUKqdIZBFA
 2CAGPjzaGRDAjzTpkRmgSVb67hnWOnM+IQIGyJaP3r/IMY+gZoO3B/K/FIK/C4SwaNH9V7SvHbH
 FIu4T2lPpss3QUxOCsm4CcJWGv5Hcs7qXt5BvqP3hIVRySCGSXNgXhbLfN+GqedYrI3oVZIV
X-Proofpoint-ORIG-GUID: 68GlciHmRAHe-9YPjOC9ic-oQ9iantSt
X-Authority-Analysis: v=2.4 cv=A+5sP7WG c=1 sm=1 tr=0 ts=688b9645 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jCSb1mbb4nv2q0GRaTwA:9
 a=CjuIK1q_8ugA:10 a=0lgtpPvCYYIA:10

On Wed, Jul 16, 2025 at 02:50:08PM +0100, Nick Alcock wrote:
> On 1 May 2025, eugene loh outgrape:
> 
> > From: Eugene Loh <eugene.loh@oracle.com>
> >
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

While in general I am all for removing unused function, I would actually
prefer to keep these because they are part of our BPF library and likely
to be of use in the future.  Yes, we could always revert this, but it is
probably more likely that we would end up re-implementing them because
we forgot they ever existed.  Since we implement our own library to
interact with the BPF subsystem, having some extra functions around for
now for functionality that isn't immediately trivial to implement when
you deal with inner maps for the first time, can be useful.
