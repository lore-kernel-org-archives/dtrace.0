Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F4413CFA4
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722530735; cv=fail; b=hGSkE6XeiVwLtcc6KyD7GLJZo9R00P8OR58CUPc+NEW05p5lE7Z5bo2KDOzZNfRp0WUgtvgbY3Qr59ebb2FXFqynyVFVZuWjo8jSZNj7n1LGSrHDNOKnFpDnoGL/R6MoBuONcL9BKeWG85vGOKF3gPXXjdWKSnQbaIHSQgoKNVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722530735; c=relaxed/simple;
	bh=36zQ7dBPAqnPOEQ/6AZR6JpDQOrWCjuEwfKYqFG2L5s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=qJvliUZPZTIB7I1FP+6QbeA05iERl/xjk+5QAbQB8AueoChoWh9xAXk/OcR9CBgxaBB9m4ZOrh3wbyBoWRaKUjMWjJKLRmAuTqxvityBLCN2KEcm3UIJcyqvjBgnxGEIeYcAl7XTYNlTmDzfH4xvtYIc4ia7S09rU8a81uzcJxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kBI4vIJs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DhV/wIe/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kBI4vIJs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DhV/wIe/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471FtVro028581
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 16:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=xaJU6Q6czmIRFF
	WwEEUd6I7K5Jgkr1hbatSRkAs6pCw=; b=kBI4vIJsETkrbkKgqf04Io/BZ6KhXQ
	QfCzgySvP88KDI9gBV8q/S1LcPHv0psWhHN8P6uNGkylN4m/9EAqRNlXeV7dJ72P
	/+RLLCk5E7pxYcswz6EY5mOb46yF8poF+IhRg/gBBsgwzkf0BDFzaQRvaEIrAG3I
	1/D7dbbpAxeA357966lUGlyr3AgNasxYHCgdCt5UvgYaTVpyVOxIgxpD1q7CHZmk
	d/A3PGmmFG4Xw1EcHx/FXHQWQuH4hCFnVJrXlW2prnh+6JDIkYKy19QOGcX5LKeq
	H/BUdpV9OMQNX6HEIT4ahILoCHiDCGkhOHd+ZZKgZ75oZDh7y0wV6qOQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqfyj8c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 16:45:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471GB3HM036436
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 16:45:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp0fa7k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 16:45:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v46U+6j+J5A+kX+HEUJBkEDKngSKj52NgO5tX7zqw8OII3SEmavlVffnZEI35w5FAGVc8ud5kadAaaoKVg1RfOpn7co6n/S5Z1p7lYd3d7EWm6M4XiPACAxbB4VAYtpRQKy6I8XrISy/csxNeex5uyup4SKkG5u1I0USAImTp4e3En+hk+HivZC6Fh3yznsRlf96+XDxkMAwqSOtGonuSGAJXXqIC3Q2UfCxnMr1rrZ4Qnj2mJKXC4A7ekR3QUCp8q2wPS2SebMNQ/zg85qfybpN1oIVUIw3Kce1RvnB1QvwCjflPDnLHF0bEaCcGfmYD2KY6Q1yix7oirQ63tkaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaJU6Q6czmIRFFWwEEUd6I7K5Jgkr1hbatSRkAs6pCw=;
 b=oYGbwf7DdggcR1wjgMnY+RL1FTTNMM9Gm+iajQkb3WTwkl2WmlLR6tw41iD037cd7yDUUVQypujglC1qroy+d+KnTKEme9yvmoHGzeJj0iZrNasa32TkpMDl1sNVq4ucvijxDmHA9XmS+XITFvPkz4KQ/nHyYCA2UCgNSoI7tHLHZ4EkzLJOcOZKUzD2RC38noPJtkrSVTRmqFotktAPYg0ERqdZE7zeXaqubU+5Seby5ewi/qpI8tjiI4JuTdHYiPEd94eQTNEYODIcoo13nZ02culh9txDWeYUIkr3j+PvLQeSSsoLS54ABIjS/9HJlA8yo9gh6BQlk28lcDPoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaJU6Q6czmIRFFWwEEUd6I7K5Jgkr1hbatSRkAs6pCw=;
 b=DhV/wIe/tN2ihzh3c9gG0aZEhvjCqaI/R63lfl9gu7jqqL6GuV6MiKqOJkZsyQdZr/p/xMfRVxpEqzxRdiRsPgm3Ff1+eesQoKlxc3iPi+0B2b83x+zxN8WZJ9MD5voOO/tLjNpKoscStsxjaFTg97vzJJKwv8TOLCk/v6IFWUI=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BL3PR10MB6164.namprd10.prod.outlook.com (2603:10b6:208:3bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 16:45:28 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 16:45:28 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 0/9] relocatable DTrace
References: <20240531185928.363245-1-nick.alcock@oracle.com>
	<ZqqOogLNszSvuMmW@oracle.com> <87a5hxmj5n.fsf@esperi.org.uk>
	<ZqqaYbavY9AMUiEP@oracle.com>
Emacs: if SIGINT doesn't work, try a tranquilizer.
Date: Thu, 01 Aug 2024 17:45:21 +0100
In-Reply-To: <ZqqaYbavY9AMUiEP@oracle.com> (Kris Van Hees's message of "Wed,
	31 Jul 2024 16:11:13 -0400")
Message-ID: <87sevojiou.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0285.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::20) To SN7PR10MB6595.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::18)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BL3PR10MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 30afb6ed-7052-4f15-bbec-08dcb2495915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5E9g58D8g1p1GOj1Zwde1Obp/1nfU3MRDNMk8sj/kXGRgAYErQBcB4/rh06d?=
 =?us-ascii?Q?mJqsSCofssJ9z76x7GrzmAwes5XByJRmMGUMcWFnJxuwtKnZ2TzUilOsv3pe?=
 =?us-ascii?Q?nJLhDedFzPwmTiZE8FY0C5e6vkDHD2GHPfE1TiDQohH48DcfsJ3nHymgIodo?=
 =?us-ascii?Q?aR87R86G9Gr8/aeIXhH90T2A0jz7iMBC17Xa/Zzuxjm1N25hlgIzKOntqTdx?=
 =?us-ascii?Q?dle+mSh17fJkEO9xahe+5EmTHDBeYORU25r6DKgaB0gQW7CWuqGdUlwSRSL3?=
 =?us-ascii?Q?5DKdxfCdi+5kDyKv938MJ2hDul4MOUbtyVgIhOyOKqfNov5omwy2qRLhjK7k?=
 =?us-ascii?Q?+Ldt56cZoJbkb6f+oyc4V0tUi4bW89vaahgl+wtCQPPdo/5LGcZVwOObddfT?=
 =?us-ascii?Q?YmF3pkycJzqF10Xg/IonnNR5+fG8BRUSxSeFzgTXBW7QCFzc6whi2ptUe7gG?=
 =?us-ascii?Q?feGz19ZGFaTEf5JfHuhK9QEHMQh8tM8gbejiJQly81d7oFlT/9N9jIYetvoo?=
 =?us-ascii?Q?6FXrGrgCfJHTN4udDMcGyVQedSlmr2IZ6Rop6dvzPcW6OMaZ5VtTjl4GhLMO?=
 =?us-ascii?Q?soqgAC/IQuptKTjvJFe27TkSZfEC8WwksvIhet1nLhghvJ3yJ/suhxSCJpfR?=
 =?us-ascii?Q?UEH+aFju7u9CCk35DdIm4kNKWY0+penpaYo1V6rL5+yAd+PWjy5WSiJaRmK3?=
 =?us-ascii?Q?7AU4W3njYTbU69+sREeegrO9GTP648i2NGZX44MY7Ctsja9mVG5NE6dIx7Q2?=
 =?us-ascii?Q?7KvALgjiJMzf2lV9jvw1Th3KJVvzvbKxzoICarLJG884XUgsCd3x9ICMX+i1?=
 =?us-ascii?Q?V/UVqs0n87LHfWAosO4a64A3bJNaNjsb0hNAAyL9xOx5ESGdetsahyenNwNW?=
 =?us-ascii?Q?UsTYCG39n3MeqkQ8DDgLGvaGxNb3hy5Bb8R04cmTUV67jqV2v6UwLGQuHNIB?=
 =?us-ascii?Q?NDxjQNHWQ96ynARxGOHP0+Z88s94A0mbxXHhWKEA8iy1plYmA6recXMEmpve?=
 =?us-ascii?Q?Esp2XMW8iTKiqm8AUXLPB9FNC4sI9R8e2dr72vyfKTVVehmEqd4gfrbPWbAA?=
 =?us-ascii?Q?PeuhFwakbgUIlJa6ZqSKNHU9aq1/mByO1+4uZOEhL84N2J4pIhxr5O2nNHHz?=
 =?us-ascii?Q?MYGGk3ACU6KwdKvYOmRdixdG+VGuhY2QE04np5sJxc7KMo2JJJkuNpG3KFKK?=
 =?us-ascii?Q?fb6hZj5+GEaxUMXDnQMNe8aod2DpmfXHvcl5bxGQmizPKd6bNPKMobQ2Dx3Q?=
 =?us-ascii?Q?LkFZaisRcn7ZUHWYE6/FCTlJduw93cBAgoLKgE1wiXk2bB7danJpJMJxcjb1?=
 =?us-ascii?Q?SCK8Dv87NO20xrN6RhG7JDFn9Pbe6wFdXzo/3ntf8DWj1w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CujjKqv4QAtTsH/DBZB1RjGc4tc4gQI7TmykcAiBF4kTu1xCRdQBjO8zylnr?=
 =?us-ascii?Q?3Z5syrq4ceJZweROFAAUPt2hIjTzT/Tnhi3Pps9EWUt62FoyOL0uygnU789R?=
 =?us-ascii?Q?dEhvrVKiv+6ZkxxPfbtDSmkeg1rJ+FfPzRKx3ExSDU8mTBS5sY+UiJAxFtX5?=
 =?us-ascii?Q?R24lJNgIRSyVIpTj8QtmXCVmcL2CilRb9DyC104GMeif6dtHarcKCmcTE/zV?=
 =?us-ascii?Q?37hPpu9H+OW2kqVb8U3/6RR0qV/mvr/XNpvOm3GPYHhnW+E0mUoUP52Vs4Yu?=
 =?us-ascii?Q?3fG03rek8hgADss1USSf7c8y+lGfkebKMa9zeyNIo7x3r/xR9qCkT2OKyaW1?=
 =?us-ascii?Q?FkZQgTgwA81uzMiygonw2s49fHlosuBuZnsZ3QppG5PxCJGJOSU+OkUDmU8/?=
 =?us-ascii?Q?HowjPkoPl4cwRAms7mSxtzyH4QpXHA0b64y0dngDr3t+iZlhMfxwSgZjxBrj?=
 =?us-ascii?Q?X6FXNGF65cvIHigW98a9LWr3qtFRAasVsUEldClDH3u02OZeCknxtmOqazDO?=
 =?us-ascii?Q?7Ff4fFbXuXTHLGAPHjq4LcVyK6KUZG01eyowaDIMMoBx5D70cXfGP6B9pZOi?=
 =?us-ascii?Q?h/q/eqKyKmcacsSTFKKVaAx6w0sWy2tt3v185sZcGpfMBcZFxVal2FBQaKE9?=
 =?us-ascii?Q?dVv8AxtBuBuBdZPzg9WwrVExPRhQakVo+JmMKz93bCFt6UUPyBuvvCBUsu4A?=
 =?us-ascii?Q?SB77MMlq68GOP89vxnnV5TnD+0TPB4VzMu8WPbXCCaXFq4jS3/Ae4XbVSJF/?=
 =?us-ascii?Q?U7SvPNaww76cqFMoBY5KurW03l7rd9Z1d+7TG+PK5JDDEAzWgH2DiBiqdPqy?=
 =?us-ascii?Q?pIu/19Xy9OFRaQSZZzDAIKBhWrX0tqSzTz7t82ygdFQmk9kOozViYM5WurXN?=
 =?us-ascii?Q?U6c4M+HdcELe/oHa3vyspZPNq7jR0FlMd7fJeqvIjHdmgzim0qePtl1ECJP6?=
 =?us-ascii?Q?9+FEfoPx4DtEQE2HuZ7n5hYs4qRmdtgNVB1iKJNnNTk3ziimjy7XmdIp9XzR?=
 =?us-ascii?Q?95cM8J2OZccSBazkR1VUkLqOZv4F4sxlt8UA6RzCj7efjw/hm84L23Z8Fwjr?=
 =?us-ascii?Q?7htnUa71yKKRHVgNUbA7uyKWt3GkWgkD4UVXgrEqPSlN1UjByavmYss4K3ya?=
 =?us-ascii?Q?uESs2l46HNXWfjJ+amZaNGPDRQseIjOtbQRccEmIk5YoWdM8oRzhTLx2EdxH?=
 =?us-ascii?Q?IKWyN6lrDXv7mRJog0VbTrffDiCKC73BsdiT3Ve4AQJCSXVEdSlm6bqGAb6z?=
 =?us-ascii?Q?mYpquykZXiw6hbesjxQQWGUYInaimrqEJ2fcHkwqbKDd2syWcZeduMeKUyq4?=
 =?us-ascii?Q?ZDWCiJLOZ9tf8VY5HZ5t1ofSWtedBDR6nRUcZdWaLNnxI0ossweeam1vd09P?=
 =?us-ascii?Q?KfHMswccNxdflbPidqcNnMp4ezQLfKGcy5A+re1nK2ZKHwqfmnHWLeqnQfwt?=
 =?us-ascii?Q?GJIrssNCWhM/9I9LZvqyeC4jck7twsgLYof1QGZk/w/3XOwEauoHqwdtAiHl?=
 =?us-ascii?Q?Xv4ZkohDJYFrpfOBS7OB8RVpd9xjuBaJu3Fa1r671Kax1cAqiFzYvrQSoC6j?=
 =?us-ascii?Q?gPiVn4ErWLRsvmuYigzunwMDm1B6Hwj8xFOlZSMKGJAKbk2arqbFH9v/01L9?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	h+I5NYfV/53L6KGn8dxJ6J/E/jYJV068nTtNVSyg/xgqzMI5ZgOcXa55pftQIVwEPIMvZY6ZzRtUiyq64mbRXTdwczvMv/R/1290pe/vkAJ4vHm3BPSFdGEUlx6D4rlk7XctPMMmUva0jsiJCxIKgclMoVg+QoLVDQvo6RBL3oQ607feOlK54NHIg3eQjgJDbD1/B1xoqaaBVzYbe9n1bPbkE3tnaS0XjOba4vfZ9C5fRzP5IbN5U8TFJdxTeFyFzfT1wnsbKTCjBB8A3zGfHxRcZSQoqMSfbUkoNYq4ANXYhKGr7cTv/9DqbugPS7l4Blhm9SWJD+OZhRrB6hxZNYSZJxoLDMLei0VYZpxUG8JxOC5dlTktERNmllPOwl73xieQ12RkpBWlKwYY0nhO45tp1KWhq9SusiHV5WuZpjiqNEjaysSV4yXmOXJKxFRwECQiG6Q6YVBb04d8pB5tb2vGdsqGPBO+P4oJ3QvvunkklQ15Ebu9LNrhm1w94XdLuhfaCZn1SYKXdsOGnjNXJICFxIsHv1BI6MtObqfvE2YaS53Kx8CkTZu1ylhZ3hMsEL8kg45KKjkNjCdbmrZojr7IL0h1ipkxQnANcmLcoc0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30afb6ed-7052-4f15-bbec-08dcb2495915
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 16:45:27.9689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+hHzSI90Is3JQ9z3DhYvBM52kOgingZ0FJvH21jfNop1bIzRwaiC1s1IHpf/shBhgYr2H7DK8umvnrzpkjMvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6164
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_15,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=962 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010110
X-Proofpoint-GUID: -v1t3YsCSUBFw5Zn0G-LpA1JP9eXnFyX
X-Proofpoint-ORIG-GUID: -v1t3YsCSUBFw5Zn0G-LpA1JP9eXnFyX

On 31 Jul 2024, Kris Van Hees outgrape:

> On Wed, Jul 31, 2024 at 08:54:44PM +0100, Nick Alcock wrote:
>> On 31 Jul 2024, Kris Van Hees said:
>> 
>> > General comments because my review covers the entire series...
>> >
>> > Why are there two pkg_config files being introduced when it seems like a
>> > single dtrace.pc one would be sufficient.  The dtrace utility is used both
>> > for tracing and for the building of libraries and executables with USDT
>> > probes,  I see no reason why a single dtrace.pc couldn't cover both.
>> 
>> Simply because there are two distinct use cases here that require a
>> different set of libraries and headers from different places: "we want
>> to use USDT using <sdt.h>", and "we are a DTrace consumer". Almost
>> nothing wants both, only one wants a library, etc etc.
>> 
>> Bear in mind that more-or-less universal usage of pkg-config (as in,
>> with CMake, Autoconf and Meson it is hard to impossible to do anything
>> else) has the caller appending $(pkg-config --cflags $pkg) to CFLAGS or
>> CPPFLAGS and $(pkg-config --libs $pkg) to LIBS. If we tried to use the
>> same pkg-config file, this would mean that *raw USDT probe users* would
>> find themselves linking with libdtrace! This is *surely* not what we
>> want.
>
> If people do that without actually checking whether it makes any sense, then
> that would be an argument (to me) to not use pkg-config at all.  Using
> pkg-config to get --libs when there is no library to link with is pointless
> and merely shows that the person using this has no diea what they are doing.

Agreed. If someone is putting the pkg-config files somewhere unusual,
it's because they have *already* pointed pkg-config at that new place,
so we can rely on pkg-config still working.

We can handle people changing --prefix alone (the overwhelmingly common
case) by setting the pkg-config path to "../../../share/pkgconfig" :)

> The cflags argument I can accept, but then perhaps we need *3* pkg-config
> files?

No need.

>        What exactly do we need this for?  Testsuite needs to know where to
> find dtrace, so that could need a pkg-config file.  Anyone wanting to use
> libdtrace would need to know where to find the library and what cflags to
> use (finding the include files), which would need a pkg-config file.  And
> compiling code with SDT would need another pkg-config file.

We need two -- one for consumers (which need to know where dtrace.h and
libdtrace are) and one for sdt users (which need to know where sdt.h
is). We can just add the dtrace= variable pointing at the executable to
both: either might potentially find it useful to know that, and an
unused variable in a pkg-config file is harmless.

-- 
NULL && (void)
