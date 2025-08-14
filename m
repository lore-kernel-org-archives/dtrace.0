Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E651C1E51EE
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755202546; cv=fail; b=hPMhgQBoahrthcWFN2Dyp8WpdHCE6INBOtrseFe+WoYMFLLOVyrTrYzl7TSqy3VfxY3lyj55NlYPXYrecWRzvgRVQqHvTz/vkSJUg1jELoBXm+gKHE6tuF0eThCpUyUIlpBN6brHktDUWRWH5AwmI6IZ9anjeP6Ko7fQxg1iIgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755202546; c=relaxed/simple;
	bh=yVJuCt9DW1XJ1bbu0jZWIDjhmHbVOwOrBqdwCaMBPDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bKaDLO9Oz8sNDRzWa2EwYUciei7gk2KycNIy86uWW3KNPUeBNHV3KV0a8hkUTxgvXoNzIWdhwNReU2c/+1q1XdAljFXH2LudHWYmB1kZb9xiDgI5rlzKFKL6FncPul4GlOKHWGz2Dn38YeBYDgkxaG+e4d5IhcLZE9qpzppiOvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HDqC1GQR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G+peG2du; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HDqC1GQR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G+peG2du"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfqKd025426;
	Thu, 14 Aug 2025 20:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=G5M2wnD0RYnVlYFS59
	wrjPrKONNWDQjDfQZGsN6sANQ=; b=HDqC1GQR0ZSuhijT+vnu0gM1eGhKI+CNim
	Osb44gKY2YtJekjsHC5mj6LMlHQGCzlEgFg8KQIG/tL9UFPCMISHmTyPHvRPsyJ1
	GLpyx3XP8CENoU5QeyCfSVNBcoYARiXvcHOkySdcNHf+4BPiEA2bo9nKNhLrhVR+
	KuVngOKC67a/UU58LlNN7tBXCMEtRcjc4AQbOXp1/PhPy1AN/UYb4ABSBtYDootR
	uQz+nGm0Qdtw5GXtmw+j7a+hOi41VaYKNC+sCAhuUpEj12fl2fME+bjQlyrHenid
	HlWF5CSEKbM9OHibUrF48u1CoU4GZtpjjtjrjfzVRHqVdo7lxrSw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxvx2rft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Aug 2025 20:15:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EJ7rFt017466;
	Thu, 14 Aug 2025 20:15:42 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd6ju0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Aug 2025 20:15:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPHGwH+rVMqT9QJssjygaABLMR3emWQD6DPeSuQyJg/UWX8JYExHq9a8qaTRy6Ri2Pk6Kj++/BAJqRvTYcxJK4MzIqp4DL0VN0Ti+nys8gzyjTIu+Yg4V+dEESxQW5aW0kYQhTu5rtlvsSebW3Wi9vq2iF0366+72Gqr/M7kbeyOlBZHMhh5D1+NDXM6ibX287r2Hc3zaJS61KEAIHZ5bqSTwlNa9RU6w94/zBQsOmZ19ZRUWcJ9H4iX/Wp66BjMVH+FfUvRyNM3wuSEAKE+/RbQZmhwrlZLaUIKOCB9ov/+nbIbNmbjGFs37QaxK1qC3byRylKS5uF2nROVRmUK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5M2wnD0RYnVlYFS59wrjPrKONNWDQjDfQZGsN6sANQ=;
 b=RsnEt/BNak6VyK4fv/f9+6HdTdmDcytkv2q7UzS5M6lv/8BGIyhc90z9WamJc9f9kVzMIO2IPYvXon0/DDFFauL9C3gWCcSW7axOa53jgZhA1KHhtorxgdBSfO2qCe5ChLmzCGfZL2tQcNCXbqd+dsqCNFHRYcyPmMw5qh5n0boDaqtH5i6jJuRsmZ26Q4McmzD8mJOECzjlpqzsCj8GBcZSWoOsrcCY+ZTQx3pGNuO2Mr/DvBvJ43P5NZEVFlTnpid74D3aMcRV9OCGpmt/Sd9twAVbuzKUfZ/cTIAbI8U0AcTzNrYe7Z7Viz0vY90WP0v+JgKBuZummrLiAT4mvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5M2wnD0RYnVlYFS59wrjPrKONNWDQjDfQZGsN6sANQ=;
 b=G+peG2dufwkmY7lGd9U70TzakP7JZ1JDGYP6qN4+go2OxE9lSaptihy2D1Uy95/VIr7nmy2DJGDsGZiLtGpXl6IIZ9tv8SmcBnVlZVosV5i3oo6mOemfzUPPKmxojXhYQ+XlvKpj2+tJv6Ft+ZudQegJk4Uj+xPUGikq+xlrSE8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SN7PR10MB6406.namprd10.prod.outlook.com (2603:10b6:806:26a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 20:15:40 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 20:15:39 +0000
Date: Thu, 14 Aug 2025 16:15:36 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>,
        dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH] bpf: force generating code that all
 verifiers accept
Message-ID: <aJ5D6HVguDBu8Ww3@oracle.com>
References: <SJ0PR10MB5672B2F52AD47A7F26420D14C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <87h5y9k7gm.fsf@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5y9k7gm.fsf@gentoo.org>
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SN7PR10MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe3d6e1-0ba6-4350-b3b2-08dddb6f567a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dM3LknODDxAYU43fYkbK+lFh9r/0Nclm4zAdugE0XxGapY2LQGJmkHlDZt1x?=
 =?us-ascii?Q?ZpmsqBWy/2p6MHu8dnylXVC6TOgAcCxnigOoK4gPyhPBlI4RVNFMNbzwt1qV?=
 =?us-ascii?Q?xaOqDZWSCRGhpYIARjjDB4flGqn9IalPuQXU+rU5EZpFskBViDGW0mk065PD?=
 =?us-ascii?Q?BieuchON8beHobz6SMEpEBrszoBrzNw2CZHydOpUlBiSLFSjUNO8BzN5IpHq?=
 =?us-ascii?Q?kQLXZwNbs4+Sfn91n5sqHs5JQ574bPcve1p0gYDBwP8dN4Fk8Ekfkn4lU4Xv?=
 =?us-ascii?Q?jlKb8qA1g81D3FiKO5+tIFREALwgau0t4xn05wiNSt0bW/fk++X3Zag2gBHg?=
 =?us-ascii?Q?T9wDBk0sZKXfYgYucmmsmr25jUCuuQYuY8n3baWruDB3V1ZmWd6j+sFwXb5p?=
 =?us-ascii?Q?KMl/F/oDUh64wfL7Jwh/rvftfxKmjjZLWiqiesQy5p676cP1DlEZSAufjm8C?=
 =?us-ascii?Q?7AFAMvNFBuk2Id9NlkiXHyYJ9M78f8c7X24mgOnZk5oHplxWfMRhQwTvanVp?=
 =?us-ascii?Q?XH7w8cT5N1SteQnrJ2t8rsZyW2Ocn3yyfKr/ffvsQZSQpB69vEK2AsTrhpCP?=
 =?us-ascii?Q?HgDzgVkJPQfeclT+3il5CvFivJ7pZp4hCf7vHbi1EZD+SxVfHpF09DVCzziX?=
 =?us-ascii?Q?wi9T34CqJFmonYZOeM7isVvsvYCAPfgLNKIAiyo6WvyS8UBNIs3myRO5x23w?=
 =?us-ascii?Q?HVjwFaaz8ZRL6O6uNTEvgOjrmnFJ1pM807VldMzORsKa2W4s+eaKYlMbqBTa?=
 =?us-ascii?Q?yqCuc/C1ZhzajdWctz6k3yvPKhtsU+K4BWX9/iO9FR2i39NwcF+cBCiatKvF?=
 =?us-ascii?Q?xXL5XF7euS3JoRPpxa8/L6j0xtvP05b8Jv8ldrWUqoxS3W4CTNLRxVWj1UPb?=
 =?us-ascii?Q?TI9VeYdmbV5lM1l1xwGfPALUfaPK2oHlW+Q8rkdEyUox/inJwdMSllP8JNd2?=
 =?us-ascii?Q?sigG2xK+DOraj+R2XQxCiiNFmYIjt0LO5LnkaiBCE9RGRomNIq6AMg64mebo?=
 =?us-ascii?Q?B/Qs5GytYM6v4oM+MwW4mYyk1nHfNKBu2Va2uZ1Y2FnhIqFpcmT1pQKn+TP/?=
 =?us-ascii?Q?2AkjyuhHLXhDbiAY+uiXsWC3/P3f+aDvatPm6qrHnlr4nk0tNWqWQPfLW/aB?=
 =?us-ascii?Q?A3Sz1PG3IJO/4F/4JMyCqzOH9oFQZXoXUY+O6NZwe+NebtB079/hPlu+M89o?=
 =?us-ascii?Q?WexUFCtpLXGQ5xDd/HvklkjlXt0JkNHMWz7hy+gJTO9wzfVG4I9pGrvB74Q6?=
 =?us-ascii?Q?2+mbQJ7eLv/OZvGIppjtKKp/tic3q6U5gaPbBaGuDMSgMuXusb65dtvQDkTT?=
 =?us-ascii?Q?MhHBRF/8DWglxYyrAiY6up6WuOlEz3TYCNID5zrBN3hI3VYaJoH4oyQb6qUR?=
 =?us-ascii?Q?1uuSahACTIL4Rb0r5nOBbv6DCLQWjQv1wNX/FQV5FRkqCzwpeJwhxyGH9hpm?=
 =?us-ascii?Q?HXlxN6u3V50=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7o6P+JBQJHF7H/BGuS4lrg4m3xnl3v4n1SVDumlbYB/Sg0NphtwJBDJ75w7R?=
 =?us-ascii?Q?PvPFnWAsUTWX0HSnu5r5e+F84TgaRTbrd1QMOSm3f3OsM6+tf5CqCuGu7G77?=
 =?us-ascii?Q?rX0zFweMI7lcDOiyAlciNPlne1x+l4D+vAQPC51WYYCHuLqZEk6CieyAwjXP?=
 =?us-ascii?Q?YxX4CjWUnCDiCkgXhVmXQQDo52YTe1xICMzaIupILTL7FtrkTGGwW+gyKOhJ?=
 =?us-ascii?Q?otLsi5i53uoyVq0MfWOtKCEwyK2k4OkMwVo3iWOrL4NwGA0a+Wytu4CVITUW?=
 =?us-ascii?Q?TXaccbMXOmhQ5/3AQh8eu4iJDtZ7RRufZj6a7dZyhCpmTeemLQQkjPjS50PG?=
 =?us-ascii?Q?Ee6AuY7fIBmKsunBZ359nd+gG/YSnwU2Yb3GUgVgpp/5KCNpiG2yQY+ZZrSw?=
 =?us-ascii?Q?Pf03zqr5/SQ5x3moi784OPhaqPEN84vQwIkgSvtUHUvJMSW4/V/yzZarNW50?=
 =?us-ascii?Q?eF8gYEtmIxBDmyEJnSdnpc44K02VmcCqOb9vLzo+qZo2QS9LeEJLes8HQLbf?=
 =?us-ascii?Q?/gU31yOIe+mTWlRsg2TV+mdZOwZSnLsyrBTi6SUDaS+hFBAhMq9BSHbLrRUj?=
 =?us-ascii?Q?C1GamK+9AFM6UzD+dMj8/cRByM95pM04kMyB3rGXCq9Gwlq5/hBtGiRpsONQ?=
 =?us-ascii?Q?bMhCH87RBebr6Ye3DLZziOiDokUm1vQ+Wh+rF7dvU/Iv75lOwitCJgB1W4KH?=
 =?us-ascii?Q?+MLMOYdjtMdBPlyyjePDpDel4tPGCfn5GzKWe8xviJcHYDaQuIqwUxVX6Ufd?=
 =?us-ascii?Q?Zkm44kE5gG3R8gDIpNX5ISgaTg1m/PPLaczdQftWJi7c0pn/IfUonxJ/0Bie?=
 =?us-ascii?Q?1+V+cENIE11UoMQkNmYvpppbwFGtA5+KXz2eQ+Xj6rKjvsnUdESyU3O+PpyZ?=
 =?us-ascii?Q?GiJb0dH84lh6NiSUdJ0nbxe3P2HbQTX9x+eLTMt+i9GVSjtDsSiPETskxUlv?=
 =?us-ascii?Q?7TdhksWt7ubcGh8DxkzdOHwPHDmzPtLROA/6iul79wtAyEvb7zOTPMLsZxtf?=
 =?us-ascii?Q?u6UF1BmUE8HJ7W6bYNG2oJbhVKtDQV9vkYzKz6EHZsNJacwtmUF7zdCgxDoL?=
 =?us-ascii?Q?3CaEHOtDWYTSFzb/KKN0VjyNYeIH5FRiRTuJfCFdzMf0IkQLbRj9XRfJQoWR?=
 =?us-ascii?Q?qcRZQkMCVV8IvH0utDgbWCYRbxJqaOloEZMjrFN5STP0Jz5/r/m52Fv4wVMW?=
 =?us-ascii?Q?ajSv7dy5iss2pQDHPMEaAYOWgWdWgsIYvvvjruM+L6qLzWWZZwWvdIas5l7G?=
 =?us-ascii?Q?bgE+rJRopLa185nvVAXQZXsvRXCgpiWedJC9paGwRWfzo/+twnKD3B6HJ2Qa?=
 =?us-ascii?Q?SnItbvth5d97p2Yb6BXWnLvQN7g5r5VBaUWCHUYqQCEv/59L0VfVP6Kfv2BR?=
 =?us-ascii?Q?QmJ4P1rzisE+Wajk21lBZibDRCGOsn3gSoD+vbBV/2LynzjamK9DDl4IDFk7?=
 =?us-ascii?Q?GA3W6QTWKVWaAMpPHDGsTcJqLUxDVVaSyPLtHsftjETavL/+CcufyIFHFnRq?=
 =?us-ascii?Q?9XIzP395lbmq+bJ43BaczLSXCXUM7dcviu/c4PLlQiPFBpFEpTFbVOeJclzU?=
 =?us-ascii?Q?TGUyJtX8sppdSv1P3/CERbN+sBmn7QapkQGk5gtSt8hH1oqR9YpxGRUIYoNa?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9PnkVTOWV4+rdWi6CDviwoWSYeErIiT/8+IpKMkp3vBRJT99c9N6NmAj4ufco5y5sOxsog14PX2bjku3r4kKOUh6A0bMw8nslQqqiogOGPE8Fmwv5cUYKZQ03M2VN74oqKhHzK5rC9YT1el3Pg9orJ1v+rJrY7M/HSyj7H0lpr8alN9/Y01OVEzSPUHmlXH4b8dc//zv01WasFcaT/sITJGtMwCGhTF8wsnTH0lVm3vZH9MKvxhr6Eb7EZ49mM+QAEGeyXRor6pyXnIT5YqaILP2Yw165z9Rk23rWze1h0GXVFb5IRxn0Cb6BFztlnlOAKHP2w91NLpELn1RJSYFURzmM0aGcRV33n99xGGsEeu/WYAXnTtcHoOs/Xk6T7AyO48RrESuRHFI1vvGX1VFNzG9n4Hub5igXPIACRoXmyElacJ4JNZj9YwwnPv+o91cZSGF1biFTCRV9pVV+02sUnz5t5nrnHS1B5gUbPbaNPrDuFyRc2IVczNvti55dzrNiqqf25hU/8sMN4qvpxykybUZxvGdNZeUljqk0T+tYNYsP5ozuaqXZoTnatrNv+Ht7Wac52ncT264Ru0DUfaHNpF0CnJj/m6lc8UWKWRT6XE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe3d6e1-0ba6-4350-b3b2-08dddb6f567a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:15:39.7787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7S9xm/OuiX3SPwsz0zshEZVTEzStkVaxUa39O7wu1uk8S3S8XxRN32cmX3TCxzFWeB9W1WjtTgxZDLGKjZG8LEoLlYm79qTGjLcYK4u8w8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6406
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508140173
X-Proofpoint-GUID: ZuA2FlKgV6OHKLmzKAKrLnFx9MzSZ7oz
X-Proofpoint-ORIG-GUID: ZuA2FlKgV6OHKLmzKAKrLnFx9MzSZ7oz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE3MyBTYWx0ZWRfX/DVqnJO/KYLY
 nKehL5r2SBtgaG2TQScJaYBTACzJne9RdYbMOztEy1Rkxox74brK5MAhrOfhG75eoUMsBa6qUE3
 /TmRQNevthHvATaFvFKaQbn0xfntnieDGTccnRaX/jLpSmGpuTo584eGylMmJNzh3+QLssBrIwC
 6urtwu/WA0ukb8TWP0rZ4u16v5mnodXeVEB2Q3HU1NLK4dYetTpyZTsWGfhqTp6YdgIwJdsmXT6
 oZl7bDaTDk14cotRkiI07URkSgA2SIDGdJI27N0Y/hpUKpKvWCCLgrsyYRxIAn+3Vt0nCm4CC6H
 G+Ogc7h5zSbnUPqzbN8OVIJUFFQ0JTQofGqJv3OWbq7p4qy3KcWt2a9pFvsz9IdJejBWXMQTw/0
 sbX/N6EdWO58YfHsEDr6vDrzlq8zro/VmqvY5M0pZ1aQTG7ZtsYuBYgekDb075Rt0svjL7jg
X-Authority-Analysis: v=2.4 cv=dpnbC0g4 c=1 sm=1 tr=0 ts=689e43ef b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=oCNW2M2eobkRmq23QRUA:9
 a=CjuIK1q_8ugA:10

On Thu, Aug 14, 2025 at 08:51:21PM +0100, Sam James wrote:
> Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com> writes:
> 
> > The compiler could optimize val = *valp in a way where the verifier on
> > older kernels would complain.  We use inline assembler to force the
> > not optimize this expression and instead to always read the value as a
> > scalar.
> 
> I'd mention a known-bad kernel version and some testcase which
> definitely hit it, so we know when we can remove it in future.

Thanks for the feedback - good idea.

> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >  bpf/get_dvar.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
> > index 073cca57c..aa14eca58 100644
> > --- a/bpf/get_dvar.c
> > +++ b/bpf/get_dvar.c
> > @@ -150,7 +150,24 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
> >  		if (valp == 0)
> >  			return dt_no_dvar();
> >  		*valp = (uint64_t)valp;
> > -		val = *valp;
> > +		/*
> > +		 * We used to do:
> > +		 *	val = *valp;
> > +		 * but the compiler could use knowledge that *valp is valp from
> > +		 * the assignment above, and use that same value (whith is a
> > +		 * map_value address).  Older kernels do not allow a map_value
> > +		 * address to be used as map key, and a verifier failure would
> > +		 * be triggered by this code optimization.
> > +		 *
> > +		 * We use inline assembler to force reading the value from the
> > +		 * map value rather than allowing the compiler to optimize this
> > +		 * code.  This works for all kernels.
> > +		 */
> > +		asm ("ldxdw %0, %1" \
> > +			: "=r" (val) \
> > +			: "m" (*valp) \
> > +			: /* no clobber */
> > +		);
> >  	} else {
> >  		/*
> >  		 * Record the value (used as key into the dvars map), and if we
