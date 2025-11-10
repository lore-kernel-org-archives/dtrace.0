Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6891E492A
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762788481; cv=fail; b=t0//iZQkqmDmeSc0ZJ4bEVYl0ZgsUMIBQW6afBZThLh++kzfxZO6SFdwcqgCIsNAEtPOMv/Jhl3m+ppSdw6OzBp5/XlysjtC8fngbZveDqA9j6btcxrJUr/5h7AiwdwlHpkzsK0icn2au74jIjNksGguWOCSB4D5TDbqxkpBOLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762788481; c=relaxed/simple;
	bh=EfC2dbwV9doip1EMsv0PpE8WQyEiQrdu4MggJb9NVN0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=pMZSbgAbMXW0/0YvkhRw+wBkriFb5i5cAO1DL4ftoDEcYNinez8kP1fBQlcINNiLGDY0xlFXa4eqj2vSDAb/3lMelZSmis0XWEAcG2W7q9Yjkaa7J750Tgn6+1byfKcuEOwoBFJjAeVItLRyuO4ZMAORXyINOpKqiNJWRkxb37Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XYqY1U95; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bwAb6y2Z; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XYqY1U95";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bwAb6y2Z"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAEgKR9022903
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Z/rxpBmE7e6t/eJSqGkq3//VV20VN/uZZ2UEc1ajghU=; b=
	XYqY1U95vu7ZNMD5J6TX6izr7fL7iO7ewfkfIj3BOSJdlI3A58dxrjW7ktQZIrNj
	0SrwojnipLM3Ewd4zZSFlv06YWkTOnZ1CyDFr61EL9a5eFwoHO0dFOjoZL6U1F5E
	+FlZOUMySwWwsN1YLonN7ijr/QoSft06WlTJxzvW7ugZitmdd7oYnk6PRWt5eaG9
	7pmG468ytC0HO/YmaDgfYB8W/i0rGByvSZA1axrtPpnfZGbvc4MyNGOaKa3rSnFl
	xW6CoTZ/fqbhTl1erxmyYywwYNQ+sJzEdUzxWmMyrbBCq1YaN14JgHb79jqzm0P2
	Or7G939LROO7W8LL3sj6rQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4abgwt88c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:27:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAEEW1K020709
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:27:57 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012068.outbound.protection.outlook.com [40.107.209.68])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9va898hk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:27:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCGqTCo2xKMhqBIJLT9VFkGFhNKm3xWeXIb4p6qJKsfQgY+CpxMKg0SDWVMEtbixhLRLc9rTBgx0UxgN+9CoKUiFeq05SWkG1k584HkLdbX1Rvmyf1P39d6IiyE0Ew8RXCE8LP8MMHE1XKdpfTruuPPRc8cv/bX7QJIDS8W0c0ikfis3uPwLBG1XnXfqJRmtiPNjVeLh9BFr3Fsnbwyo23etISYQTohvpJI25Sb/auTNSkRx+HHcTcJtDj8/AgpbcfqHu08FNIweqFeP1k6j11EJ/ubJhua8FjYR77D4WJMtHZ8IqUOkLvndruSesic1aZpa/BS1ST5jn/Z7vm8+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/rxpBmE7e6t/eJSqGkq3//VV20VN/uZZ2UEc1ajghU=;
 b=DumiMv/I9hZiOC7NoXST60WbT4zSlBaTcCW/KVRMKMGdfea49DjjToQMhh2Xo/r7U7fnynMNFB81oADpPJY24tE7+JrbjAj8jF5Ql0mgIFGdfRFgyzlsM8+S1eDBu8nGcMSw2tjUym346cgtaWIuAwDrY9egPc/tbVQfgAtqfXZTCyYnLp5TaGVEjg72ujdeCsFrIiPWIpNKrMxHTABh29UI3m4e+IxV7n5w/8RsdlgSN/EDFlVFT/EJv2hvu8qYpr9F4ypGPkrx+7rbEp08CdCSRTPAvZl3R8yXL9QYT3RQ0UOMI9qI5cAJ93xbo6zzcWstUkXrNr3CkV47v0aIiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/rxpBmE7e6t/eJSqGkq3//VV20VN/uZZ2UEc1ajghU=;
 b=bwAb6y2ZYvbVaz7DMvi7vlK9VXJYoTwt9ftIwFB66htv10U0asPja3b34CyWf25AzxX5OaP3pSPIArfWrwZIR4wWRDsNmDUIzFbGyM10gjKthIy04i5ks9c3mherKxl939w6r3WhIWbhr0+T0sjjbc8CMHKjzkBYAcnwy7JA36s=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:27:54 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:27:54 +0000
Date: Mon, 10 Nov 2025 10:27:52 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] bpf: fix file descriptor leak
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB398729B40B695D3F3B541D3DC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SJ0PR10MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc9ebb9-aaca-4925-51cd-08de206db7d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8I6iN7qgIxofO2xavawfEKYdxK35x4FHwOAOPpZQQQUQw+OqGktTMddlVwjq?=
 =?us-ascii?Q?qudbI0twIEJIZISZ6vsIHF/M6mWraPI9AGQYo+dDdq1iVxAmCVE4SWFt651Y?=
 =?us-ascii?Q?1eo/lWj13tvXri72mgIWkEq0775C/WkzfTER5+Ns74+VUg+mqDqk1uMgohN2?=
 =?us-ascii?Q?WEgW3SerBev897acAZB+4bXIDo6F/vLe2bu7xw6XhMgfgqWbiI4mqLsyrr+G?=
 =?us-ascii?Q?ayIWDfWCxELh/pSFKJ/tOJ8XOaaGW6khWxufzKHw3ObhOM9tYhDHu8eJJL7g?=
 =?us-ascii?Q?pzmBxPqYjJcOspNaEdDL3u8SsvxLA45VBTRlnS9vXkgNP6vxkwO9yZX6XrpM?=
 =?us-ascii?Q?OMGRZeJNOKJQQ8LbXvAhveelXzsLqff0LMgrDvcK8KCCRtYEusicVJEDdeZ3?=
 =?us-ascii?Q?Vazg7VTUn0ZxFlrVK/oD/2cx2hioMiqD0NdKhukk4budsVR719Wzgz9wBJTI?=
 =?us-ascii?Q?vFx94KzdMtN0YnjI7a8W2sxmNQeVGBZZ/alhaJtsACdbb7rE2nE4Ce3vvBqX?=
 =?us-ascii?Q?/NvHlyOjZM4aqxvNtzc74ZC4FGmjp+LuBpcTw+RfBOYVtVLomsjROnG9qxDs?=
 =?us-ascii?Q?tyjIUkCEGClrzZwmtfa/SOGUFnTQRehWKnnbAZvHvYDb22XxBZUSg8yDgbMB?=
 =?us-ascii?Q?cSnKDn6VUbPpkOeJchNbjjkn/VUAWuYq9A+r7qFTXcwl8JOnZLiEOETk8ze0?=
 =?us-ascii?Q?SvFFNhLJ6hnlwm5BxpKg0R4wxIrTLQu1JNx6yKF6Z4xaBQA291xxomwirQKV?=
 =?us-ascii?Q?G2rS872Y22VqQEiaL1TfT78rsBezqcvOTBXbEhEsxwO/AaQl2cD1G975W8JI?=
 =?us-ascii?Q?KWz02/FQmPKWFnZf32/0DS9TShgM10HOD89z0MBM0aaYu0HqO5Vb7wKm8z/b?=
 =?us-ascii?Q?6RhNVKRYILcANE4vtJy/m+BoGwhhhvosfH7cdBPk6HtOyt8BOeOmGPyWUXPE?=
 =?us-ascii?Q?hcAA87iV91w4ZqmoEfhG+HQojlDOrQeXbeaiRDdonI97r7T/aa4FCoAKYRQW?=
 =?us-ascii?Q?vLxCPyqp1Ic3uWgz6iQcLK+Wmd6V9AdYIvHQENbo4P0a1+veh/U3S0WiawJi?=
 =?us-ascii?Q?07DzXMszBahKoqscWWhxhEfA9NmS9QcwxafZMeHQHydGgc63TJ2EuqKN6sur?=
 =?us-ascii?Q?LdnSVGq/Ac7kSi07PZ9MQbYFYpW15G3CHH/6ucsXnstBr871idSqTQKTHkGP?=
 =?us-ascii?Q?kwd6ZBKtp79sNBOA+0thxQvkdqge8L3mNj71JsLGpyATkHhRKeyDu9AgqPl4?=
 =?us-ascii?Q?6uz3M44gznpJTa/pDfNHDg8GJhLJc4QNivFLI0SMfUqIlp39CjcI42k3OsIA?=
 =?us-ascii?Q?9uz2pq/6xTRyJtHR+O7xc5ms10H0TW/DMukIE+xzzE1yL9D4lD2gpNiTd1q+?=
 =?us-ascii?Q?zkUq8c9YbtfF+UEUBxYvK8R29qpBSw0nrLvZHHYoMwd+jSbOZJp/EHdIri0H?=
 =?us-ascii?Q?IJffOGbx6rNIVk59aVTeDYoUtVpihm4E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NycTD6VN1X5egKjTM1h7r2GSghsjMRaT/RTzhUo6QJrbXXZHE70kAmoqATyK?=
 =?us-ascii?Q?mNjcxK04EodtZnT/krNK8XP9h+0G21E7sj1PODQxds4cgAFc3shyiLwRNixX?=
 =?us-ascii?Q?xXN1XOvY+l3UopwrFLStzddgxZ7kdOH2ZwPEwgfUcxp/ivttIDZ3hMZ/xbdu?=
 =?us-ascii?Q?kx4G60SBl2JnY73W9stctZr864A/GGQ7XhMStmlwaQoHM43CkJtHFGwuzts9?=
 =?us-ascii?Q?MBDD3WCh3k0ENbs7IFS8F7UOlYFOe3ziRLXXVrRQ6WidiKac1QguD/+f35yy?=
 =?us-ascii?Q?VroT/3iho7LfJOsY16jtLnqVD4hL0u0rFZqAIwMk8ASiM5nCthwvOlGEtsFQ?=
 =?us-ascii?Q?c8toZ0wayvg5FpaPy0aZYSbx/OtHAtEm1R7R4O4dn/RsYpAufTwIJMSmcutX?=
 =?us-ascii?Q?b+5BjmrpwhcLDleCh3+Wk26Gge9IIJEldo857ckF2vWXcleMs5z4soX2g5OC?=
 =?us-ascii?Q?mluRWeZvECaEiVmq0G+zBOsMD/jpN/fTTcobSpPfO8dFJbLXeRXZuVaX6ikG?=
 =?us-ascii?Q?igLuDwyqs4gue98pUxQR9Hhy12myOSzW5T1zN1YrXYhH2Maf97chDd26Whg5?=
 =?us-ascii?Q?x59KSLbNZStVDBbiB5+rVcJpS/sigp8r2rXhoniUExUAEFjH1Jsze7hgwPiB?=
 =?us-ascii?Q?av32ykyqvLPVTLAAUQfXv2YxfXnXfMvhbVNH8BJGUq6D0bvste7A6w095IYN?=
 =?us-ascii?Q?aLdztJyu/3PDDbw+sxKQUDLMic/542qWqr3CieM8zQQezvVp/SEeTlrqRmrR?=
 =?us-ascii?Q?rLmsYW1qa1sF1ljHNLv2R6M8Vtnce4TUuIS5hCoU2hnnMeYtrL1hLAHX7OTl?=
 =?us-ascii?Q?k2NJ5T/lMfcubejIgfezPC5Uh+IOpxQnIMc5NGpEMu0St/CGFPE2ypdl6XQV?=
 =?us-ascii?Q?TVOOq0ry6ko1WeDxe9wM/wut3GPDOEC81LKRy4JA0IKIsPcEfGop+WrBoWcP?=
 =?us-ascii?Q?HTnM9DO2s+2J+zrzbV5zPGrAoliTfqvA8zv0gV8nVu37Txep0602VqsVvuPB?=
 =?us-ascii?Q?4z2/cVNYVlYIO2+2hEaT6AAKulwR3ZQRrJhWTW77gdpVx3I2lu7nQNUwpAxc?=
 =?us-ascii?Q?8rOf3qsVgXWMpp6ZRPD45bdjk3xkI9evWMZHkY2oKX283OazQD8p95zFz0oW?=
 =?us-ascii?Q?Q4uo7JeLMyu9pcI5XBpyRKO9DunV+95bzD9Q4iwC7xFvqB2mkd9kq1C4M+A7?=
 =?us-ascii?Q?+ODje3yHgg/PmD0kZpWbJAQF5XsoViYtQDromkrfGhYtJZtXxQG7Ci0hirJB?=
 =?us-ascii?Q?MPl8Lq01l2Bp6rU1VzauLU4m1JxiJ4fPlaJu8uypGhVwGSRHng9tXV9KLN3J?=
 =?us-ascii?Q?IQ9HUkqD3bnZ5CH/pp2L7gA5mPmIlOXRysL9cB2reo+Nytxb+ItKZ39ZhM9w?=
 =?us-ascii?Q?1Wq+TbbcT95tHePkz587JsexFMyW1Tg4ed6QfPREsaR2QwS5dDYwGNEjh480?=
 =?us-ascii?Q?Nmrp/r/1+kUB5s4nqPQBWjOAizE5RH42g1apvQANTVByKP4HrPzbm6L90hqI?=
 =?us-ascii?Q?tB16SWQxiN9N9tOqZbgOV2vPRtzrcIvud/KZwqD8eJ478NyDXStLBkMyqHOK?=
 =?us-ascii?Q?YeWznNtNACU0RSMCpIcHMBemlzZsIECoQMG2rq/13SVk/nHuZ88Joz3KmZ1k?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Bu4Bmy5h7eU8qzjJD7IVlQMBPsMemgFSIPGzadwfEL81nefcCrhFiRqI8iN0up4WnZA8/eaGJ1oImFsZrfwLy9/5z3SGV1VxESPBZ4n9OXxtacwIGgfUZJzE9/QkzuTyNT0Ol7lCto1+E3Y91P7zN7x4rcp9o/LXm6kgvYo5I/xXFE4qHmq7C82kdEmeWyvCMJ8fv+DgI+s84l64ePffh0YJNBUD6fS1/64undsBcfg6etZf8nB20hHF8pJ5UPGSyvqMKIUIgeXeIg0DWFklWQpLDlfe2UFeOkBRi7HKY1Ghoq48r3TzbebhteC9dfPyS2N6+YI26tkHBaMnruyx7yuDHoSW2+qpeVO3Mkov+PRqv06UZsh9q8b5dLoZbwjRujiVdIu00XcvR1UHq1/UGAT6gGGfZtVvNgjKrGhdNEb9VZEND9A4CEyQRzeQNPkJOkxTTHG6rdkALBIGX2o8igHGJ+QXABwQNnPft+j104FIQIJ+4/VAp/Uoauqi2Qx3uitCecGon9j/HwJ2nY3+88Y3VVMYlEQVEKGeC9vZQj+HDlB+jPUDYMAYEZUBDwkrB6PSg1+LtbSYLupe55EiNNO49jbm5X/b7lwU/qLdVME=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc9ebb9-aaca-4925-51cd-08de206db7d2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:27:54.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RQ3rQ5D/KET+lEVPPOOTshWNLMy+p/TqapQCrjoG+wlX3HktezvF+aH6EbSSOWiZxfdpPbs6K+8mZPN4MrwSJTidxVD9m34lgOJNCVNUcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5672
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=841 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511100132
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNyBTYWx0ZWRfXxcKoYvE+vszc
 Jbva3+A14UCU1qY9BYv4SUlINWlI0QmKOiZ6r0Julr6ft/5qZFN45XniygypTtg6lMA9Fi3UV+S
 p+J0GgGyGrqf7/whFq+Y1grnQTj99boUXg5WGk19Y8dmtqIA3BRzBes0dFvVdV3ka2jzJz3p7o3
 JhOA2BpuFDduwGwHmRLqi4Pvu5umVOaAdUsujnIhSE8KX3m8I4mj6t5pETVHxFjYQHR5x6dXp39
 K2VcgY7ytRHX9nrZibJFhIqSPK7B+SZpLuart1ZjT7mORFKq6c4Q9VRPUxuYZUAiIw3AxNGdE+b
 VRJCB7+uOzydiyZwkgTo3rsJ8rJ/n5l0yyHn/KoEU5K1SkPhM6ADIqCUj9+rPJ+T5ijZXP+MJox
 /gCvqtHqTs4ma/rR/x6q6APcncdgrw==
X-Proofpoint-ORIG-GUID: 04-mIA2iNipLR1vtK2Pl3bzmgViynFI4
X-Authority-Analysis: v=2.4 cv=DpVbOW/+ c=1 sm=1 tr=0 ts=6912047e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=yuJEUzNF176T-CvbVKIA:9
X-Proofpoint-GUID: 04-mIA2iNipLR1vtK2Pl3bzmgViynFI4

When a BPF program has been attached to a perf event, it is safe to
close its file descriptor.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 0223764a..28eb890e 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1385,8 +1385,8 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 		if (prp->prov->impl->attach)
 			rc = prp->prov->impl->attach(dtp, prp, fd);
 
+		close(fd);
 		if (rc < 0 && !(prp->flags & DT_PROBE_FLAG_OPTIONAL)) {
-			close(fd);
 			dt_attach_error(dtp, rc,
 					prp->desc->prv, prp->desc->mod,
 					prp->desc->fun, prp->desc->prb);
-- 
2.43.5

